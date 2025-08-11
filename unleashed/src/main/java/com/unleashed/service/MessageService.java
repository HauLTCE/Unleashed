package com.unleashed.service;

import com.unleashed.entity.Chat;
import com.unleashed.entity.Message;
import com.unleashed.entity.User;
import com.unleashed.repo.ChatRepository;
import com.unleashed.repo.MessageRepository;
import com.unleashed.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MessageService {

    private final MessageRepository messageRepository;
    private final ChatRepository chatRepository;
    private final UserRepository userRepository;

    @Autowired
    public MessageService(MessageRepository messageRepository, ChatRepository chatRepository, UserRepository userRepository) {
        this.messageRepository = messageRepository;
        this.chatRepository = chatRepository;
        this.userRepository = userRepository;
    }

    @Transactional(readOnly = true)
    public List<Message> getMessagesForCustomerChat(String customerUserId) {
        UUID customerUuid = UUID.fromString(customerUserId);
        User customer = userRepository.findById(customerUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer user ID: " + customerUserId));

        if (customer.getRole().getId() != 2) {
            throw new IllegalArgumentException("User is not a customer.");
        }

        Optional<Chat> chat = chatRepository.findChatsByUserId(customerUuid).stream().findFirst();
        return chat.map(messageRepository::findByChat).orElse(List.of());
    }

    @Transactional
    public Message sendMessage(String senderId, String customerId, String messageText) {
        if (senderId == null || senderId.isEmpty() || customerId == null || customerId.isEmpty() || messageText == null || messageText.isEmpty()) {
            throw new IllegalArgumentException("Sender ID, customer ID, and message text cannot be null or empty.");
        }
        UUID senderUuid = UUID.fromString(senderId);
        UUID customerUuid = UUID.fromString(customerId);

        User sender = userRepository.findById(senderUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid sender user ID: " + senderId));
        User customer = userRepository.findById(customerUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer user ID: " + customerId));

        if (sender.getRole().getId() != 3 && !sender.getUserId().equals(customer.getUserId())) {
            throw new IllegalArgumentException("Sender must be a staff member or the customer.");
        }

        if (customer.getRole().getId() != 2) {
            throw new IllegalArgumentException("Receiver is not a customer");
        }

        Chat chat = chatRepository.findChatsByUserId(customerUuid).stream().findFirst().orElseGet(() -> {
            Chat newChat = new Chat();
            newChat.setUserId(customer);
            return chatRepository.save(newChat);
        });

        Message message = new Message();
        message.setChat(chat);
        message.setSender(sender);
        message.setMessageText(messageText);
        message.setMessageSendAt(OffsetDateTime.now());
        message.setIsMessageEdited(false);
        message.setIsMessageDeleted(false);

        return messageRepository.save(message);
    }

    @Transactional
    public Message editMessage(Integer messageId, String editorId, String newMessageText) {
        if (messageId == null || editorId == null || editorId.isEmpty() || newMessageText == null || newMessageText.trim().isEmpty()) {
            throw new IllegalArgumentException("Message ID, editor ID, and new message text cannot be null or empty.");
        }
        UUID editorUuid = UUID.fromString(editorId);

        Message message = messageRepository.findById(messageId)
                .orElseThrow(() -> new IllegalArgumentException("Message not found with ID: " + messageId));

        User editor = userRepository.findById(editorUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid editor user ID: " + editorId));

        if (!message.getSender().getUserId().equals(editor.getUserId()) && editor.getRole().getId() != 3) {
            throw new IllegalArgumentException("User not authorized to edit this message.");
        }
        message.setMessageText(newMessageText);
        message.setIsMessageEdited(true);
        return messageRepository.save(message);
    }

    @Transactional
    public Message deleteMessage(Integer messageId, String deleterId) {
        if (messageId == null || deleterId == null || deleterId.isEmpty()) {
            throw new IllegalArgumentException("Message ID and deleter ID cannot be null or empty.");
        }
        UUID deleterUuid = UUID.fromString(deleterId);

        Message message = messageRepository.findById(messageId)
                .orElseThrow(() -> new IllegalArgumentException("Message not found with ID: " + messageId));

        User deleter = userRepository.findById(deleterUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid deleter user ID: " + deleterId));

        if (!message.getSender().getUserId().equals(deleter.getUserId()) && deleter.getRole().getId() != 3) {
            throw new IllegalArgumentException("User not authorized to delete this message.");
        }

        message.setIsMessageDeleted(true);
        return messageRepository.save(message);
    }

    @Transactional
    public void hardDeleteMessage(Integer messageId) {
        if (messageRepository.existsById(messageId)) {
            messageRepository.deleteById(messageId);
        } else {
            throw new IllegalArgumentException("Message not found: " + messageId);
        }
    }

    @Transactional(readOnly = true)
    public Optional<Message> getMessageById(Integer messageId, String userId) {
        if (messageId == null || userId == null || userId.isEmpty()) {
            throw new IllegalArgumentException("Message ID and User ID cannot be null.");
        }
        UUID userUuid = UUID.fromString(userId);

        Optional<Message> message = messageRepository.findById(messageId);
        if (message.isEmpty()) {
            return Optional.empty();
        }

        User user = userRepository.findById(userUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " + userId));

        boolean isSender = message.get().getSender().getUserId().equals(userUuid);
        boolean isStaff = user.getRole().getId() == 3;
        boolean isChatParticipant = message.get().getChat().getUserId().getUserId().equals(userUuid);

        if (isSender || isStaff || isChatParticipant) {
            return message;
        } else {
            return Optional.empty();
        }
    }

    @Transactional(readOnly = true)
    public List<Message> searchMessagesInChat(String customerUserId, String searchText) {
        if (customerUserId == null || customerUserId.isEmpty() || searchText == null || searchText.isEmpty()) {
            throw new IllegalArgumentException("Customer user ID and search text cannot be null or empty.");
        }
        UUID customerUuid = UUID.fromString(customerUserId);

        User customer = userRepository.findById(customerUuid)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer user ID: " + customerUserId));

        if (customer.getRole().getId() != 2) {
            throw new IllegalArgumentException("User is not a customer.");
        }

        Optional<Chat> chat = chatRepository.findChatsByUserId(customerUuid).stream().findFirst();
        return chat.map(value -> messageRepository.findByChatIdOrderByMessageSendAtAsc(value.getId()).stream()
                .filter(message -> message.getMessageText() != null && message.getMessageText().toLowerCase().contains(searchText.toLowerCase()))
                .toList()).orElseGet(List::of);

    }

    @Transactional(readOnly = true)
    public List<Message> getMessagesByIds(List<Integer> messageIds) {
        return messageRepository.findAllById(messageIds);
    }

}