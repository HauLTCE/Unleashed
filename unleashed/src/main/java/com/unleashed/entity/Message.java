package com.unleashed.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.OffsetDateTime;

@Getter
@Setter
@Entity
@Table(name = "message", schema = "dbo")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "message_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "chat_id")
    private Chat chat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sender_id")
    private User sender;

    @Nationalized
    @Column(name = "message_text")
    private String messageText;

    @Column(name = "message_send_at")
    private OffsetDateTime messageSendAt;

    @Size(max = 255)
    @Nationalized
    @Column(name = "message_image_url")
    private String messageImageUrl;

    @Column(name = "is_message_edited")
    private Boolean isMessageEdited;

    @Column(name = "is_message_deleted")
    private Boolean isMessageDeleted;

    @PrePersist
    protected void onCreate() {
        setMessageSendAt(OffsetDateTime.now());
    }
}