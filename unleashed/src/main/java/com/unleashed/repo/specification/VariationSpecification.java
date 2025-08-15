package com.unleashed.repo.specification;

import com.unleashed.entity.*;
import jakarta.persistence.criteria.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class VariationSpecification implements Specification<Variation> {

    private final String searchTerm;

    public VariationSpecification(String searchTerm) {
        this.searchTerm = searchTerm;
    }

    @Override
    public Predicate toPredicate(Root<Variation> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
        if (!StringUtils.hasText(searchTerm)) {
            return cb.conjunction();
        }

        String likePattern = "%" + searchTerm.toLowerCase() + "%";

        // Join to related entities
        Join<Variation, Product> productJoin = root.join("product", JoinType.LEFT);
        Join<Product, Brand> brandJoin = productJoin.join("brand", JoinType.LEFT);
        Join<Variation, Size> sizeJoin = root.join("size", JoinType.LEFT);
        Join<Variation, Color> colorJoin = root.join("color", JoinType.LEFT);

        // Create a list of potential matches
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.like(cb.lower(productJoin.get("productName")), likePattern));
        predicates.add(cb.like(cb.lower(brandJoin.get("brandName")), likePattern));
        predicates.add(cb.like(cb.lower(sizeJoin.get("sizeName")), likePattern));
        predicates.add(cb.like(cb.lower(colorJoin.get("colorName")), likePattern));

//        query.distinct(true);

        // Combine the conditions with OR
        return cb.or(predicates.toArray(new Predicate[0]));
    }
}