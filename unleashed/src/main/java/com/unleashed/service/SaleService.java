package com.unleashed.service;

import com.unleashed.dto.ProductSaleDTO;
import com.unleashed.dto.ResponseDTO;
import com.unleashed.entity.Product;
import com.unleashed.entity.Sale;
import com.unleashed.entity.SaleProduct;
import com.unleashed.entity.SaleStatus;
import com.unleashed.entity.composite.SaleProductId;
import com.unleashed.repo.ProductRepository;
import com.unleashed.repo.SaleProductRepository;
import com.unleashed.repo.SaleRepository;
import com.unleashed.repo.SaleStatusRepository;
import com.unleashed.repo.specification.ProductSpecification;
import com.unleashed.repo.specification.SaleSpecification;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class SaleService {

    private final SaleRepository saleRepository;
    private final ProductRepository productRepository;
    private final SaleProductRepository saleProductRepository;
    private final SaleStatusRepository saleStatusRepository;

    public SaleService(SaleRepository saleRepository, ProductRepository productRepository, SaleProductRepository saleProductRepository, SaleStatusRepository saleStatusRepository) {
        this.saleRepository = saleRepository;
        this.productRepository = productRepository;
        this.saleProductRepository = saleProductRepository;
        this.saleStatusRepository = saleStatusRepository;
    }

    @Transactional
    public List<Sale> findAll() {
        List<Sale> saleList = saleRepository.findAllByOrderByIdDesc();
        SaleStatus expiredeStaus = saleStatusRepository.getReferenceById(3);
        SaleStatus inactiveStatus = saleStatusRepository.getReferenceById(1);
        OffsetDateTime nowDate = OffsetDateTime.now();
        saleList.forEach(sale -> {
            if (sale.getSaleEndDate().isBefore(nowDate)) {
                sale.setSaleStatus(expiredeStaus);
            } else if (sale.getSaleStatus().getId().equals(expiredeStaus.getId())) {
                sale.setSaleStatus(inactiveStatus);
                saleRepository.save(sale);
            }
        });
        saleRepository.saveAll(saleList);
        return saleList;
    }

    @Transactional(readOnly = true)
    public Page<Sale> getSales(String search, String statusFilter, Pageable pageable) {
        // First, update all sale statuses based on their end dates
        updateExpiredSaleStatuses();

        Specification<Sale> spec = new SaleSpecification(search, statusFilter);
        return saleRepository.findAll(spec, pageable);
    }

    @Transactional // Make this transactional as it can now perform deletions
    public Page<ProductSaleDTO> getProductsInSale(int saleId, String search, Pageable pageable) {
        // --- SELF-HEALING LOGIC ---
        // 1. Get all products currently associated with the sale
        List<SaleProduct> currentSaleProducts = saleProductRepository.findByIdSaleId(saleId);
        List<SaleProduct> productsToRemove = new ArrayList<>();
        List<String> validProductIds = new ArrayList<>();

        // 2. Check stock for each product
        for (SaleProduct sp : currentSaleProducts) {
            Integer totalStock = productRepository.findTotalStockForProduct(sp.getId().getProductId());
            if (totalStock == null || totalStock <= 0) {
                // If stock is zero or null, mark it for removal
                productsToRemove.add(sp);
            } else {
                // Otherwise, it's valid to be shown
                validProductIds.add(sp.getId().getProductId().toString());
            }
        }

        // 3. Perform the removal from the sale
        if (!productsToRemove.isEmpty()) {
            saleProductRepository.deleteAll(productsToRemove);
        }
        // --- END OF SELF-HEALING LOGIC ---

        // 4. Build the final query based only on the valid, in-stock products
        Specification<Product> spec = Specification
                .where(ProductSpecification.inProductIds(validProductIds))
                .and(ProductSpecification.hasNameLike(search));

        Page<Product> productPage = productRepository.findAll(spec, pageable);
        return productPage.map(ProductSaleDTO::fromEntity);
    }

    @Transactional(readOnly = true)
    public Page<ProductSaleDTO> getProductsNotInSale(int saleId, String search, Pageable pageable) {
        List<String> productIdsInSale = saleProductRepository.findByIdSaleId(saleId).stream()
                .map(sp -> sp.getId().getProductId().toString())
                .collect(Collectors.toList());

        // --- APPLY THE NEW STOCK FILTER ---
        Specification<Product> spec = Specification
                .where(ProductSpecification.notInProductIds(productIdsInSale))
                .and(ProductSpecification.hasNameLike(search))
                .and(ProductSpecification.hasStock()); // Only show products with stock > 0

        Page<Product> productPage = productRepository.findAll(spec, pageable);
        return productPage.map(ProductSaleDTO::fromEntity);
    }

    // A helper method to keep status logic reusable
    private void updateExpiredSaleStatuses() {
        List<Sale> allSales = saleRepository.findAll();
        SaleStatus expiredStatus = saleStatusRepository.findById(3).orElse(null); // Assuming 3 is EXPIRED
        SaleStatus activeStatus = saleStatusRepository.findById(2).orElse(null); // Assuming 2 is ACTIVE
        OffsetDateTime now = OffsetDateTime.now();

        List<Sale> salesToUpdate = new ArrayList<>();
        for (Sale sale : allSales) {
            boolean needsUpdate = false;
            // If the sale is expired but its status is not 'EXPIRED'
            if (sale.getSaleEndDate().isBefore(now) && !sale.getSaleStatus().getId().equals(expiredStatus.getId())) {
                sale.setSaleStatus(expiredStatus);
                needsUpdate = true;
            }
            // If the sale is NOT expired but its status is 'EXPIRED' (e.g., date was edited)
            if (sale.getSaleEndDate().isAfter(now) && sale.getSaleStartDate().isBefore(now) && sale.getSaleStatus().getId().equals(expiredStatus.getId())) {
                sale.setSaleStatus(activeStatus);
                needsUpdate = true;
            }

            if (needsUpdate) {
                salesToUpdate.add(sale);
            }
        }
        if (!salesToUpdate.isEmpty()) {
            saleRepository.saveAll(salesToUpdate);
        }
    }


    @Transactional
    public Sale createSale(Sale sale) {
        if (sale == null) {
            throw new IllegalArgumentException("Sale data must not be null");
        }
        sale.setSaleCreatedAt(OffsetDateTime.now());
        return saleRepository.save(sale);
    }

    @Transactional
    public ResponseEntity<?> updateSale(Integer saleId, Sale saleData) {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Updated sale Successfully");
        Sale existingSale = saleRepository.findById(saleId).orElse(null);

        if (existingSale == null) {
            responseDTO.setMessage("Sale not found");
            responseDTO.setStatusCode(HttpStatus.NOT_FOUND.value());
            return ResponseEntity.status(responseDTO.getStatusCode()).body(responseDTO);
        }
        existingSale.setSaleType(saleData.getSaleType());
        existingSale.setSaleValue(saleData.getSaleValue());
        existingSale.setSaleStartDate(saleData.getSaleStartDate());
        existingSale.setSaleEndDate(saleData.getSaleEndDate());
        existingSale.setSaleStatus(saleData.getSaleStatus());
        existingSale.setSaleUpdatedAt(OffsetDateTime.now());
        Sale EditedSale = saleRepository.save(existingSale);

        return ResponseEntity.ok().body(EditedSale);
    }

    @Transactional
    public ResponseEntity<?> deleteSale(Integer saleId) {
        ResponseDTO responseDTO = new ResponseDTO();
        Sale sale = saleRepository.findById(saleId)
                .orElseThrow(() -> new EntityNotFoundException("Sale not found with id: " + saleId));

        // Before deleting the sale, we must delete the associations in the join table
        List<SaleProduct> relatedProducts = saleProductRepository.findByIdSaleId(saleId);
        if (!relatedProducts.isEmpty()) {
            saleProductRepository.deleteAll(relatedProducts);
        }

        saleRepository.delete(sale);

        responseDTO.setMessage("Sale " + saleId + " deleted successfully.");
        responseDTO.setStatusCode(HttpStatus.OK.value());
        return ResponseEntity.ok(responseDTO);
    }

    @Transactional
    public ResponseEntity<?> findSaleById(Integer saleId) {
        ResponseDTO responseDTO = new ResponseDTO();
        Sale sale = saleRepository.findById(saleId).orElse(null);
        if (sale == null) {
            responseDTO.setMessage("Sale not found");
            responseDTO.setStatusCode(HttpStatus.NOT_FOUND.value());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(responseDTO);
        }
        return ResponseEntity.ok().body(sale);
    }

    @Transactional
    public ResponseEntity<?> addProductsToSale(Integer saleId, List<String> productIds) {
        Sale sale = saleRepository.findById(saleId)
                .orElseThrow(() -> new EntityNotFoundException("Sale not found"));

        List<SaleProduct> saleProductsToSave = new ArrayList<>();
        for (String productIdStr : productIds) {
            UUID productId = UUID.fromString(productIdStr);
            Product product = productRepository.findById(productId).orElse(null);
            if (product == null) continue;

            SaleProductId id = new SaleProductId(saleId, productId);
            SaleProduct saleProduct = SaleProduct.builder()
                    .id(id)
                    .sale(sale)
                    .product(product)
                    .build();
            saleProductsToSave.add(saleProduct);
        }

        if (!saleProductsToSave.isEmpty()) {
            saleProductRepository.saveAll(saleProductsToSave);
        }

        return ResponseEntity.ok().body("Products added successfully");
    }

    @Transactional
    public ResponseEntity<ResponseDTO> removeProductFromSale(int saleId, String productIdStr) {
        ResponseDTO responseDTO = new ResponseDTO();
        try {
            UUID productId = UUID.fromString(productIdStr);
            saleRepository.findById(saleId)
                    .orElseThrow(() -> new RuntimeException("Sale not found"));

            productRepository.findById(productId)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            SaleProductId id = new SaleProductId(saleId, productId);
            Optional<SaleProduct> existingSaleProductOpt = saleProductRepository.findById(id);

            if (existingSaleProductOpt.isPresent()) {
                saleProductRepository.delete(existingSaleProductOpt.get());
                responseDTO.setMessage("Product removed successfully from sale.");
                responseDTO.setStatusCode(200);
            } else {
                responseDTO.setMessage("Product not found in this sale.");
                responseDTO.setStatusCode(404);
            }
        } catch (RuntimeException e) {
            responseDTO.setMessage(e.getMessage());
            responseDTO.setStatusCode(404);
        }
        return ResponseEntity.status(responseDTO.getStatusCode()).body(responseDTO);
    }

    @Transactional(readOnly = true)
    public ResponseEntity<List<Product>> getProductsInSale(int saleId) {
        try {
            saleRepository.findById(saleId)
                    .orElseThrow(() -> new RuntimeException("Sale not found"));

            List<SaleProduct> saleProducts = saleProductRepository.findByIdSaleId(saleId);

            List<Product> products = saleProducts.stream()
                    .map(sp -> productRepository.findById(sp.getId().getProductId()).orElse(null))
                    .filter(Objects::nonNull)
                    .collect(Collectors.toList());

            return ResponseEntity.ok(products);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @Transactional
    public ResponseEntity<?> getListProductsInSales() {
        return ResponseEntity.status(HttpStatus.OK).body(saleProductRepository.getAllProductsInSales());
    }

}