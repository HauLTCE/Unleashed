package com.unleashed.repo;

import com.unleashed.dto.SimplifiedTransactionCardDTO;
import com.unleashed.dto.TransactionCardDTO;
import com.unleashed.entity.Provider;
import com.unleashed.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer> {

    @Query(value = """
                SELECT DISTINCT NEW com.unleashed.dto.SimplifiedTransactionCardDTO(
                    t.id,
                    p.productId,
                    v.variationImage,
                    p.productName,
                    s.stockName,
                    tt.transactionTypeName,
                    br.brandName,
                    si.sizeName,
                    col.colorName,
                    col.colorHexCode,
                    t.transactionProductPrice,
                    t.transactionQuantity,
                    t.transactionDate,
                    u.userUsername,
                    pr.providerName
                )
                FROM Transaction t
                LEFT JOIN t.variation v
                LEFT JOIN v.product p
                LEFT JOIN t.stock s
                LEFT JOIN t.transactionType tt
                LEFT JOIN p.brand br
                LEFT JOIN v.size si
                LEFT JOIN v.color col
                LEFT JOIN t.inchargeEmployee u
                LEFT JOIN t.provider pr
                ORDER BY t.id DESC
            """)
    List<SimplifiedTransactionCardDTO> findSimplifiedTransactionCardDTOsOrderByIdDesc();

    // Optional but useful based on your choice B: Method to fetch full transactions by IDs
    // Spring Data JPA can derive this, or you can write a query if needed.
    // Ensure EAGER fetches don't cause N+1 if called for many IDs - consider @EntityGraph later if needed.
    List<Transaction> findByIdInOrderByIdDesc(List<Integer> ids);

    boolean existsByProvider(Provider provider);
}