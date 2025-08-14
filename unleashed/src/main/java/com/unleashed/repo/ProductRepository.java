package com.unleashed.repo;

import com.unleashed.entity.Brand;
import com.unleashed.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;
import java.util.stream.Collectors;

@Repository
public interface ProductRepository extends JpaRepository<Product, UUID>, JpaSpecificationExecutor<Product> {


    @Query("SELECT p.productName FROM Product p left join Variation v on p.productId = v.product.productId WHERE v.id = :variationId")
    String getProductNameById(@Param("variationId") Integer variationId);

    boolean existsByBrand(Brand brand);

    boolean existsByCategories_Id(int categoryId);


    @Modifying
    @Query("UPDATE Product p SET p.productStatus.id = null WHERE p.productId = :id")
    void softDeleteProduct(@Param("id") UUID id);


    @Modifying
    @Query(value = "INSERT INTO product_category (product_id, category_id) VALUES (:productId, :categoryId)", nativeQuery = true)
    void addProductCategory(@Param("productId") UUID productId, @Param("categoryId") Integer categoryId);

    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.productVariations WHERE p.productId = :productId")
    Product findProductWithVariations(@Param("productId") UUID productId);

    @Query(value = """
            SELECT p, v,
                   COALESCE(AVG(r.reviewRating), 0) AS averageRating,
                   COUNT(r.reviewRating) AS totalRatings
            FROM Product p
            LEFT JOIN Variation v
                ON v.id = (
                    SELECT MIN(v2.id)
                    FROM Variation v2
                    WHERE v2.product.productId = p.productId
                )
            LEFT JOIN Review r ON p.productId = r.product.productId
            WHERE (
                              LOWER(p.productName) LIKE LOWER(concat('%', :query, '%'))
                           OR LOWER(p.productCode) LIKE LOWER(concat('%', :query, '%'))
                           OR LOWER(p.productDescription) LIKE LOWER(concat('%', :query, '%'))
                          )
                      AND p.productStatus IS NOT NULL
            GROUP BY p, v, p.productId, p.productName, p.productCode, p.productDescription, p.productCreatedAt, p.productUpdatedAt
            ORDER BY p.productId ASC
            """,
            countQuery = """
                    SELECT COUNT(DISTINCT p.productId)
                    FROM Product p
                    WHERE LOWER(p.productName) LIKE LOWER(concat('%', :query, '%'))
                       OR LOWER(p.productCode) LIKE LOWER(concat('%', :query, '%'))
                       OR LOWER(p.productDescription) LIKE LOWER(concat('%', :query, '%'))
                    """)
    Page<Object[]> searchProducts(@Param("query") String query, Pageable pageable);

    List<Product> findByProductIdIn(List<UUID> productIds);

    @Query("SELECT p.productId FROM Product p WHERE p.productCode = :productCode")
    UUID findIdByProductCode(@Param("productCode") String productCode);

    @Query("""
                SELECT DISTINCT p FROM Product p
                JOIN FETCH p.productVariations v
                JOIN StockVariation sv ON sv.id.variationId = v.id
                WHERE sv.stockQuantity > 0
            """)
    List<Product> findProductsInStock();

    @Query("SELECT p.productId FROM Product p WHERE p.productCode IN :productCodes")
    List<UUID> findIdsByProductCodes(@Param("productCodes") List<String> productCodes);


    @Query("SELECT p FROM Product p WHERE p.productId IN :productIds")
    List<Product> findProductsByIds(@Param("productIds") List<UUID> productIds);

    @Query("SELECT p FROM Product p WHERE p.productStatus IS NOT NULL")
    List<Product> findAllActiveProducts();

    @Query("SELECT p.productName FROM Product p WHERE p.productCode = :productCode")
    Optional<String> findByProductCode(@Param("productCode") String productCode);

    @Query("""
            SELECT p.productId, cat.categoryName
            FROM Product p
            JOIN p.categories cat
            WHERE p.productId IN :productIds
            """)
    List<Object[]> findRawCategoryDataForProductIds(@Param("productIds") Set<UUID> productIds);

    @Query(value = """
            SELECT p, v,
                   COALESCE(AVG(r.reviewRating), 0.0) AS averageRating,
                   COUNT(r.id) AS totalRatings
            FROM Product p
            JOIN p.brand b
            JOIN p.categories cat
            LEFT JOIN Variation v
                ON v.id = (
                    SELECT MIN(v2.id)
                    FROM Variation v2
                    WHERE v2.product.productId = p.productId
                )
            LEFT JOIN Review r ON p.productId = r.product.productId
            WHERE (
                (:query IS NULL OR :query = '' OR LOWER(p.productName) LIKE LOWER(concat('%', :query, '%')))
                AND (:category IS NULL OR :category = '' OR cat.categoryName = :category)
                AND (:brand IS NULL OR :brand = '' OR b.brandName = :brand)
            )
            AND p.productStatus IS NOT NULL
            GROUP BY p, v
            HAVING COALESCE(AVG(r.reviewRating), 0.0) >= :rating
            """,
            countQuery = """
             SELECT COUNT(DISTINCT p.productId)
             FROM Product p
             JOIN p.brand b
             JOIN p.categories cat
             WHERE (
                (:query IS NULL OR :query = '' OR LOWER(p.productName) LIKE LOWER(concat('%', :query, '%')))
                AND (:category IS NULL OR :category = '' OR cat.categoryName = :category)
                AND (:brand IS NULL OR :brand = '' OR b.brandName = :brand)
             )
             AND p.productStatus IS NOT NULL
             AND (SELECT COALESCE(AVG(r.reviewRating), 0.0) FROM Review r WHERE r.product.productId = p.productId) >= :rating
             """)
    Page<Object[]> findProductsWithFilters(
            @Param("query") String query,
            @Param("category") String category,
            @Param("brand") String brand,
            @Param("rating") float rating,
            Pageable pageable);


    default Map<UUID, List<String>> findCategoryNamesMapByProductIds(Set<UUID> productIds) {
        if (productIds == null || productIds.isEmpty()) {
            return Collections.emptyMap();
        }
        List<Object[]> results = findRawCategoryDataForProductIds(productIds);
        return results.stream()
                .collect(Collectors.groupingBy(
                        result -> (UUID) result[0],
                        Collectors.mapping(
                                result -> (String) result[1],
                                Collectors.toList())
                ));

    }


    @Query("SELECT SUM(sv.stockQuantity) FROM StockVariation sv WHERE sv.variation.product.productId = :productId")
    Integer findTotalStockForProduct(@Param("productId") UUID productId);


}