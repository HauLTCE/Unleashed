package com.unleashed.repo;

import com.unleashed.dto.SimplifiedTransactionCardDTO;
import com.unleashed.entity.Provider;
import com.unleashed.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository for handling Transaction entities.
 * Extends JpaSpecificationExecutor to allow for dynamic, criteria-based queries
 * which are used for searching and filtering.
 */
@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer>, JpaSpecificationExecutor<Transaction> {

    /**
     * This is the original method to fetch all transactions into a simplified DTO.
     * It is not paginated and does not support dynamic filtering.
     * The new, primary method for fetching data is findAll(Specification, Pageable),
     * which is provided by JpaSpecificationExecutor.
     */
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

    /**
     * Finds a list of transactions by their IDs, ordered by ID in descending order.
     * @param ids A list of transaction IDs.
     * @return A list of Transaction entities.
     */
    List<Transaction> findByIdInOrderByIdDesc(List<Integer> ids);

    /**
     * Checks if any transactions exist for a given provider.
     * @param provider The provider entity to check against.
     * @return true if transactions exist, false otherwise.
     */
    boolean existsByProvider(Provider provider);



    List<Transaction> findByStockId(Integer stockId);
}