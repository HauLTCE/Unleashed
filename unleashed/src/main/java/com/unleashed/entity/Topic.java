package com.unleashed.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "topic", schema = "dbo")
public class Topic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "topic_id", nullable = false)
    private Integer id;

    @Nationalized
    @Lob
    @Column(name = "topic_name")
    private String topicName;

    @OneToMany(mappedBy = "topic")
    private Set<Feedback> feedbacks = new LinkedHashSet<>();

}