package com.unleashed.repo;

import com.unleashed.entity.composite.OrderVariationSingleId;
import com.unleashed.entity.OrderVariationSingle;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface OrderVariationSingleRepository extends JpaRepository<OrderVariationSingle, OrderVariationSingleId> {

    List<OrderVariationSingle> findById_OrderId(String orderId);

    @Query("SELECT ovs FROM OrderVariationSingle ovs WHERE ovs.order.user.userId = :userId")
    List<OrderVariationSingle> findByUserUserId(@Param("userId") UUID userId);

    List<OrderVariationSingle> findById_OrderIdIn(List<String> orderIds);


    @Query(value = """
            WITH ParsedCodes AS (
                SELECT
                    ovs.order_id,
                    ovs.variation_single_id,
                    ovs.variation_price_at_purchase,
                    SUBSTRING(vs.variation_single_code, 1, CHARINDEX('-', vs.variation_single_code) - 1) AS product_code,
                    SUBSTRING(
                        vs.variation_single_code,
                        CHARINDEX('-', vs.variation_single_code) + 1,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) - CHARINDEX('-', vs.variation_single_code) - 1
                    ) AS color_name,
                    SUBSTRING(
                        vs.variation_single_code,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) + 1,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) + 1) - CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) - 1
                    ) AS size_name
                FROM
                    dbo.order_variation_single ovs
                JOIN
                    dbo.variation_single vs ON ovs.variation_single_id = vs.variation_single_id
                WHERE
                    ovs.order_id = :orderId
            )
            SELECT
                p.product_id AS productId,
                p.product_name AS productName,
                pc.color_name AS color,
                s.size_name AS size,
                v.variation_image AS productImage,
                MIN(pc.variation_price_at_purchase) AS unitPrice,
                COUNT(pc.variation_single_id) AS quantity,
                CAST(CASE WHEN COUNT(r.review_id) > 0 THEN 1 ELSE 0 END AS BIT) AS hasReviewed
            FROM
                ParsedCodes pc
            JOIN
                dbo.product p ON pc.product_code = p.product_code
            JOIN
                dbo.color c ON pc.color_name = c.color_name
            JOIN
                dbo.size s ON pc.size_name = s.size_name
            JOIN
                dbo.variation v ON v.product_id = p.product_id AND v.color_id = c.color_id AND v.size_id = s.size_id
            LEFT JOIN
                dbo.review r ON r.product_id = p.product_id AND r.order_id = pc.order_id AND r.user_id = :userId
            GROUP BY
                p.product_id, p.product_name, pc.color_name, s.size_name, v.variation_image
            """, nativeQuery = true)
    List<Tuple> findAggregatedDetailsWithReviewStatus(@Param("orderId") String orderId, @Param("userId") UUID userId);


    @Query(value = """
            WITH ParsedCodes AS (
                SELECT
                    ovs.order_id,
                    ovs.variation_price_at_purchase,
                    SUBSTRING(vs.variation_single_code, 1, CHARINDEX('-', vs.variation_single_code) - 1) AS product_code,
                    SUBSTRING(
                        vs.variation_single_code,
                        CHARINDEX('-', vs.variation_single_code) + 1,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) - CHARINDEX('-', vs.variation_single_code) - 1
                    ) AS color_name,
                    SUBSTRING(
                        vs.variation_single_code,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) + 1,
                        CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) + 1) - CHARINDEX('-', vs.variation_single_code, CHARINDEX('-', vs.variation_single_code) + 1) - 1
                    ) AS size_name
                FROM
                    dbo.order_variation_single ovs
                JOIN
                    dbo.variation_single vs ON ovs.variation_single_id = vs.variation_single_id
                WHERE
                    ovs.order_id IN :orderIds
            )
            SELECT
                pc.order_id AS orderId,
                p.product_name AS productName,
                pc.product_code AS productCode,
                pc.color_name AS color,
                pc.size_name AS size,
                MIN(pc.variation_price_at_purchase) as unitPrice,
                COUNT(*) AS quantity
            FROM
                ParsedCodes pc
            JOIN
                dbo.product p ON pc.product_code = p.product_code
            GROUP BY
                pc.order_id, p.product_name, pc.product_code, pc.color_name, pc.size_name
            """, nativeQuery = true)
    List<Tuple> findAggregatedDetailsByOrderIds(@Param("orderIds") List<String> orderIds);
}