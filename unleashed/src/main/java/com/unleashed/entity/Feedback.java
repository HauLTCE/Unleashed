package com.unleashed.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.OffsetDateTime;

@Getter
@Setter
@Entity
@Table(name = "feedback", schema = "dbo")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feedback_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "topic_id")
    private Topic topic;

    @Nationalized
    @Lob
    @Column(name = "feedback_email")
    private String feedbackEmail;

    @Nationalized
    @Lob
    @Column(name = "feedback_content")
    private String feedbackContent;

    @Column(name = "feedback_created_at")
    private OffsetDateTime feedbackCreatedAt;

    @Column(name = "is_feedback_resolved")
    private Boolean isFeedbackResolved;

    @PrePersist
    protected void onCreate() {
        setFeedbackCreatedAt(OffsetDateTime.now());
    }

}