package com.unleashed.entity;

import jakarta.persistence.*;
import lombok.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "variation_single", schema = "dbo")
public class VariationSingle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "variation_single_id", nullable = false)
    private Integer id;

    @Nationalized
    @Lob
    @Column(name = "variation_single_code")
    private String variationSingleCode;

    @Column(name = "is_variation_single_bought")
    private Boolean isVariationSingleBought;

//    @OneToMany(mappedBy = "variationSingle")
//    private Set<Review> reviews = new LinkedHashSet<>();

    @Transient
    private String productCodeForVariationSingle;
    @Transient
    private String colorNameForVariationSingle;
    @Transient
    private String sizeNameForVariationSingle;

    @PrePersist
    public void generateVariationSingleCode() {
        if (this.variationSingleCode == null && productCodeForVariationSingle != null && colorNameForVariationSingle != null && sizeNameForVariationSingle != null) {
            String colorPrefix = colorNameForVariationSingle.toUpperCase();
            String randomNumbers = RandomStringUtils.randomNumeric(6);
            this.variationSingleCode = productCodeForVariationSingle + "-" + colorPrefix + "-" + sizeNameForVariationSingle.toUpperCase() + "-" + randomNumbers;
        }
    }
}