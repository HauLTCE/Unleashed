package com.unleashed.repo;

import com.unleashed.entity.composite.StockVariationId;
import com.unleashed.entity.StockVariation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface StockVariationRepository extends JpaRepository<StockVariation, StockVariationId> {

    @Query("SELECT sv FROM StockVariation sv WHERE sv.id.variationId = :variationId")
    List<StockVariation> findByVariationId(@Param("variationId") int variationId);

    @Query("SELECT SUM(sv.stockQuantity) FROM StockVariation sv WHERE sv.id.variationId = :variationId")
    Integer findStockProductByProductVariationId(@Param("variationId") int variationId);

    @Query("SELECT SUM(sv.stockQuantity) FROM StockVariation sv " +
            "JOIN Variation v ON sv.id.variationId = v.id " +
            "JOIN Product p ON v.product.productId = p.productId " +
            "WHERE p.productId = :productId")
    Integer getTotalStockQuantityForProduct(@Param("productId") UUID productId);
}