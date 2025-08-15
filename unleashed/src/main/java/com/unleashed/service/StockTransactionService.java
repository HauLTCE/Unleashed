package com.unleashed.service;

import com.unleashed.dto.SimplifiedTransactionCardDTO;
import com.unleashed.dto.StockTransactionDTO;
import com.unleashed.dto.TransactionCardDTO;
import com.unleashed.entity.*;
import com.unleashed.entity.composite.StockVariationId;
import com.unleashed.repo.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import com.unleashed.repo.specification.TransactionSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class StockTransactionService {

    private final VariationRepository variationRepository;
    private final TransactionRepository transactionRepository;
    private final StockRepository stockRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final TransactionTypeRepository transactionTypeRepository;
    private final StockVariationRepository stockVariationRepository;
    private final ProductStatusRepository productStatusRepository;
    private final ProviderRepository providerRepository;


    @Autowired
    public StockTransactionService(TransactionRepository transactionRepository,
                                   StockRepository stockRepository,
                                   ProductRepository productRepository,
                                   VariationRepository variationRepository,
                                   UserRepository userRepository,
                                   TransactionTypeRepository transactionTypeRepository,
                                   StockVariationRepository stockVariationRepository,
                                   ProductStatusRepository productStatusRepository,
                                   ProviderRepository providerRepository) {
        this.transactionRepository = transactionRepository;
        this.stockRepository = stockRepository;
        this.productRepository = productRepository;
        this.variationRepository = variationRepository;
        this.userRepository = userRepository;
        this.transactionTypeRepository = transactionTypeRepository;
        this.stockVariationRepository = stockVariationRepository;
        this.productStatusRepository = productStatusRepository;
        this.providerRepository = providerRepository;
    }


    @Transactional(readOnly = true)
    public List<TransactionCardDTO> findAllTransactionCards() {

        List<SimplifiedTransactionCardDTO> simpleDtos = transactionRepository.findSimplifiedTransactionCardDTOsOrderByIdDesc();

        if (simpleDtos.isEmpty()) {
            return Collections.emptyList();
        }

        Set<UUID> productIds = simpleDtos.stream()
                .map(SimplifiedTransactionCardDTO::getProductId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        Map<UUID, List<String>> productCategoryMap = productRepository.findCategoryNamesMapByProductIds(productIds);

        List<TransactionCardDTO> finalDtos = new ArrayList<>();
        for (SimplifiedTransactionCardDTO simpleDto : simpleDtos) {
            List<String> categoryNames = Collections.emptyList();
            if (simpleDto.getProductId() != null) {
                categoryNames = productCategoryMap.getOrDefault(simpleDto.getProductId(), Collections.emptyList());
            }

            String categoryNameString = String.join(", ", categoryNames);
            if (categoryNameString.isEmpty()) {
                categoryNameString = null;
            }

            TransactionCardDTO finalDto = new TransactionCardDTO(
                    simpleDto.getTransactionId(),
                    simpleDto.getVariationImage(),
                    simpleDto.getProductName(),
                    simpleDto.getStockName(),
                    simpleDto.getTransactionTypeName(),
                    categoryNameString,
                    simpleDto.getBrandName(),
                    simpleDto.getSizeName(),
                    simpleDto.getColorName(),
                    simpleDto.getColorHexCode(),
                    simpleDto.getTransactionProductPrice(),
                    simpleDto.getTransactionQuantity(),
                    simpleDto.getTransactionDate(),
                    simpleDto.getInchargeEmployeeUsername(),
                    simpleDto.getProviderName()
            );
            finalDtos.add(finalDto);
        }

        return finalDtos;
    }

    @Transactional
    public boolean createStockTransactions(StockTransactionDTO stockTransactionDTO) {
        try {
            Provider provider = providerRepository.findById(stockTransactionDTO.getProviderId())
                    .orElseThrow(() -> new IllegalArgumentException("Provider not found with ID: " + stockTransactionDTO.getProviderId()));

            Stock stock = stockRepository.findById(stockTransactionDTO.getStockId())
                    .orElseThrow(() -> new IllegalArgumentException("Stock not found with ID: " + stockTransactionDTO.getStockId()));

            User inchargeEmployee = userRepository.findByUserUsername(stockTransactionDTO.getUsername())
                    .orElseThrow(() -> new IllegalArgumentException("User not found: " + stockTransactionDTO.getUsername()));

            TransactionType transactionType = transactionTypeRepository.findById(1) // Assuming 1 is for "IN"
                    .orElseThrow(() -> new IllegalStateException("Transaction Type with ID 1 not found."));

            ProductStatus productStatus = productStatusRepository.findById(3) // Assuming 3 is for "IN STOCK"
                    .orElseThrow(() -> new IllegalStateException("Product Status with ID 3 not found."));

            for (StockTransactionDTO.ProductVariationQuantity variationQuantity : stockTransactionDTO.getVariations()) {
                Variation variation = variationRepository.findById(variationQuantity.getProductVariationId())
                        .orElseThrow(() -> new IllegalArgumentException("Product variation not found with ID: " + variationQuantity.getProductVariationId()));

                // Create and save the audit transaction log first
                Transaction transaction = new Transaction();
                transaction.setStock(stock);
                transaction.setVariation(variation);
                transaction.setProvider(provider);
                transaction.setInchargeEmployee(inchargeEmployee);
                transaction.setTransactionType(transactionType);
                transaction.setTransactionQuantity(variationQuantity.getQuantity());
                // transaction.setTransactionProductPrice(variation.getVariationPrice());
                transactionRepository.save(transaction);

                StockVariationId stockVariationId = new StockVariationId(stock.getId(), variation.getId());
                Optional<StockVariation> existingStockVariation = stockVariationRepository.findById(stockVariationId);

                if (existingStockVariation.isPresent()) {
                    StockVariation stockVariationToUpdate = existingStockVariation.get();
                    stockVariationToUpdate.setStockQuantity(stockVariationToUpdate.getStockQuantity() + variationQuantity.getQuantity());
                    stockVariationRepository.save(stockVariationToUpdate);
                } else {
                    StockVariation newStockVariation = new StockVariation();
                    newStockVariation.setId(new StockVariationId());
                    newStockVariation.setStock(stock);
                    newStockVariation.setVariation(variation);
                    newStockVariation.setStockQuantity(variationQuantity.getQuantity());
                    stockVariationRepository.save(newStockVariation);
                }

                Product product = variation.getProduct();
                product.setProductStatus(productStatus);
                productRepository.save(product);
            }
        } catch (IllegalArgumentException | IllegalStateException e) {
            System.err.println("Stock import failed: " + e.getMessage());
            return false;
        }
        return true;
    }


    @Transactional(readOnly = true)
    public Map<String, Object> getTransactions(String search, String dateFilter, String sort, int page, int size) {
        // 1. Create the Specification for dynamic WHERE clause
        Specification<Transaction> spec = new TransactionSpecification(search, dateFilter);

        // 2. Create Pageable with sorting logic from the request
        Sort sortObj = sort.equals("oldest_first")
                ? Sort.by("transactionDate").ascending()
                : Sort.by("transactionDate").descending(); // Default to newest first

        Pageable pageable = PageRequest.of(page, size, sortObj);

        // 3. Fetch the paginated data from the repository using the specification
        Page<Transaction> transactionPage = transactionRepository.findAll(spec, pageable);

        // 4. Map the fetched entities to the DTO you need for the frontend
        List<TransactionCardDTO> dtos = transactionPage.getContent().stream()
                .map(this::mapEntityToCardDTO)
                .collect(Collectors.toList());

        // 5. Build the final response object for the frontend
        Map<String, Object> response = new HashMap<>();
        response.put("transactions", dtos);
        response.put("currentPage", transactionPage.getNumber());
        response.put("totalItems", transactionPage.getTotalElements());
        response.put("totalPages", transactionPage.getTotalPages());

        return response;
    }

    // Helper method to convert a Transaction entity into the complex DTO
    private TransactionCardDTO mapEntityToCardDTO(Transaction t) {
        if (t == null) return null;

        String categoryNameString = null;
        if (t.getVariation() != null && t.getVariation().getProduct() != null && t.getVariation().getProduct().getCategories() != null) {
            categoryNameString = t.getVariation().getProduct().getCategories().stream()
                    .map(Category::getCategoryName)
                    .collect(Collectors.joining(", "));
        }

        Variation v = t.getVariation();
        Product p = (v != null) ? v.getProduct() : null;

        return new TransactionCardDTO(
                t.getId(),
                (v != null) ? v.getVariationImage() : null,
                (p != null) ? p.getProductName() : null,
                (t.getStock() != null) ? t.getStock().getStockName() : null,
                (t.getTransactionType() != null) ? t.getTransactionType().getTransactionTypeName() : null,
                categoryNameString,
                (p != null && p.getBrand() != null) ? p.getBrand().getBrandName() : null,
                (v != null && v.getSize() != null) ? v.getSize().getSizeName() : null,
                (v != null && v.getColor() != null) ? v.getColor().getColorName() : null,
                (v != null && v.getColor() != null) ? v.getColor().getColorHexCode() : null,
                t.getTransactionProductPrice(),
                t.getTransactionQuantity(),
                t.getTransactionDate(),
                (t.getInchargeEmployee() != null) ? t.getInchargeEmployee().getUsername() : null,
                (t.getProvider() != null) ? t.getProvider().getProviderName() : null
        );
    }

}