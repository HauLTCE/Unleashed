package com.unleashed.repo.specification;

import com.unleashed.entity.*;
import com.unleashed.entity.Order;
import jakarta.persistence.criteria.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class OrderSpecification implements Specification<Order> {

    private final String searchTerm;

    public OrderSpecification(String searchTerm) {
        this.searchTerm = searchTerm;
    }

    @Override
    public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
        if (!StringUtils.hasText(searchTerm)) {
            return cb.conjunction();
        }

        String likePattern = "%" + searchTerm.toLowerCase() + "%";
        List<Predicate> predicates = new ArrayList<>();

        // --- JOINS ---
        Join<Order, User> customerJoin = root.join("user", JoinType.LEFT);
        Join<Order, User> staffJoin = root.join("inchargeEmployee", JoinType.LEFT);
        Join<Order, OrderStatus> statusJoin = root.join("orderStatus", JoinType.LEFT);

        // --- PREDICATES for direct fields (with .as(String.class) fix) ---
        predicates.add(cb.like(cb.lower(customerJoin.get("userUsername").as(String.class)), likePattern));
        predicates.add(cb.like(cb.lower(staffJoin.get("userUsername").as(String.class)), likePattern));
        predicates.add(cb.like(cb.lower(statusJoin.get("orderStatusName").as(String.class)), likePattern));

        // --- SUBQUERY for Product Name Search (with .as(String.class) fix) ---
        Subquery<String> productCodeSubquery = query.subquery(String.class);
        Root<Product> productRoot = productCodeSubquery.from(Product.class);
        productCodeSubquery.select(productRoot.get("productCode"))
                .where(cb.like(cb.lower(productRoot.get("productName").as(String.class)), likePattern));

        Join<Order, OrderVariationSingle> ovsJoin = root.join("orderVariationSingles", JoinType.LEFT);
        Join<OrderVariationSingle, VariationSingle> vsJoin = ovsJoin.join("variationSingle", JoinType.LEFT);

        Expression<Integer> firstDashPosition = cb.locate(vsJoin.get("variationSingleCode"), "-");

        Expression<Integer> extractedLength = cb.selectCase()
                .when(cb.greaterThan(firstDashPosition, 0), cb.sum(firstDashPosition, -1))
                .otherwise(cb.literal(0))
                .as(Integer.class);

        Expression<String> extractedProductCode = cb.substring(
                vsJoin.get("variationSingleCode"),
                cb.literal(1),
                extractedLength
        );

        predicates.add(cb.in(extractedProductCode).value(productCodeSubquery));

        // --- FINAL QUERY CONSTRUCTION ---
        query.distinct(true);
        return cb.or(predicates.toArray(new Predicate[0]));
    }
}