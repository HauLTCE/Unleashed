package com.unleashed.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "chat", schema = "dbo")
public class Chat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "chat_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User userId;

    @Column(name = "chat_created_at")
    private OffsetDateTime chatCreatedAt;

    @OneToMany(mappedBy = "chat")
    private Set<Message> messages = new LinkedHashSet<>();

    @PrePersist
    protected void onCreate() {
        setChatCreatedAt(OffsetDateTime.now());
    }
}