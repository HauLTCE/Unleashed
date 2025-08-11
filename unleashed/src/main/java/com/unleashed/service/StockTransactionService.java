package com.unleashed.service;

import com.unleashed.dto.SimplifiedTransactionCardDTO;
import com.unleashed.dto.StockTransactionDTO;
import com.unleashed.dto.TransactionCardDTO;
import com.unleashed.entity.*;
import com.unleashed.entity.composite.StockVariationId;
import com.unleashed.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
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

            Optional<Provider> provider = providerRepository.findById(stockTransactionDTO.getProviderId());
            if (provider.isEmpty()) {
                throw new IllegalArgumentException("Provider not found with ID: " + stockTransactionDTO.getProviderId());
            }

            Optional<Stock> stock = stockRepository.findById(stockTransactionDTO.getStockId());
            if (stock.isEmpty()) {
                throw new IllegalArgumentException("Stock not found with ID: " + stockTransactionDTO.getStockId());
            }

            for (StockTransactionDTO.ProductVariationQuantity variationQuantity : stockTransactionDTO.getVariations()) {
                Optional<Variation> variation = variationRepository.findById(variationQuantity.getProductVariationId());
                if (variation.isEmpty()) {
                    throw new IllegalArgumentException("Product variation not found with ID: " + variationQuantity.getProductVariationId());
                }

                Transaction transaction = new Transaction();

                transaction.setStock(stock.get());
                transaction.setVariation(variation.get());
                transaction.setProvider(provider.get());
                transaction.setInchargeEmployee(userRepository.findByUserUsername(stockTransactionDTO.getUsername()).orElse(null));
                transaction.setTransactionType(transactionTypeRepository.findById(1).orElse(null));
                transaction.setTransactionQuantity(variationQuantity.getQuantity());
                transactionRepository.save(transaction);

                StockVariationId stockVariationId = new StockVariationId();
                stockVariationId.setStockId(stock.get().getId());
                stockVariationId.setVariationId(variation.get().getId());

                Optional<StockVariation> existingStockVariation = stockVariationRepository.findById(stockVariationId);

                if (existingStockVariation.isPresent()) {
                    StockVariation stockVariationToUpdate = existingStockVariation.get();
                    stockVariationToUpdate.setStockQuantity(stockVariationToUpdate.getStockQuantity() + variationQuantity.getQuantity());
                    stockVariationRepository.save(stockVariationToUpdate);
                } else {
                    StockVariation stockVariation = new StockVariation();
                    stockVariation.setId(stockVariationId);
                    stockVariation.setStockQuantity(variationQuantity.getQuantity());
                    stockVariationRepository.save(stockVariation);
                }
                ProductStatus productStatus = productStatusRepository.findById(3).orElse(null);
                Product product = variation.get().getProduct();
                product.setProductStatus(productStatus);
                productRepository.save(product);

            }
        } catch (IllegalArgumentException e) {
            return false;
        }
        return true;
    }
}