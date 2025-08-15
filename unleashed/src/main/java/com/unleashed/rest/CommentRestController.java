package com.unleashed.rest;

import com.unleashed.dto.CommentDTO;
import com.unleashed.entity.Comment;
import com.unleashed.entity.User;
import com.unleashed.service.CommentService;
import com.unleashed.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;

@RestController
@RequestMapping("/api/comments")
public class CommentRestController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    // The single, correct endpoint for creating a reply.
    // This is the one we designed in our strategy.
    @PostMapping
    @PreAuthorize("isAuthenticated()") // Any authenticated user can reply.
    public ResponseEntity<?> createCommentReply(@Valid @RequestBody CommentDTO commentDTO) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
            User currentUser = userService.findByUsername(currentUsername);

            if (currentUser == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "User not found"));
            }

            Comment createdComment = commentService.addCommentReply(commentDTO, currentUser);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdComment);

        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatusCode()).body(Map.of("message", e.getReason()));
        }
    }

    // The endpoint for admin replies. To avoid conflict, it now has a specific sub-path.
    @PostMapping("/admin")
    @PreAuthorize("hasAnyAuthority('ADMIN','STAFF')")
    public ResponseEntity<?> createAdminComment(@RequestBody CommentDTO newComment) {
        try {
            if (newComment == null) {
                return ResponseEntity.badRequest().body("Comment data must not be null.");
            }
            if (newComment.getComment() == null || newComment.getComment().getCommentContent().trim().isEmpty()) {
                return ResponseEntity.badRequest().body("Comment content must not be empty.");
            }

            // You will likely need a specific service method for this, e.g., commentService.addAdminReply()
            // For now, let's assume it calls a method that takes the DTO and an indicator it's an admin.
            // Let's reuse the main reply logic but get the user differently.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
            User currentUser = userService.findByUsername(currentUsername);

            Comment savedComment = commentService.addCommentReply(newComment, currentUser);
            return ResponseEntity.ok(savedComment);
        } catch (RuntimeException ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}