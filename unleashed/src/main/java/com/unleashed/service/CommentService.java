package com.unleashed.service;

import com.unleashed.dto.CommentDTO;
import com.unleashed.entity.*;
import com.unleashed.entity.composite.CommentParentId;
import com.unleashed.repo.*;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CommentService {

    private final CommentRepository commentRepository;
    private final ReviewRepository reviewRepository;
    private final UserRepository userRepository;
    private final CommentParentRepository commentParentRepository;
    private final ReviewService reviewService;
    private final ProductRepository productRepository;

    public CommentService(CommentRepository commentRepository,
                          ReviewRepository reviewRepository,
                          UserRepository userRepository,
                          CommentParentRepository commentParentRepository, ReviewService reviewService, ProductRepository productRepository) {
        this.commentRepository = commentRepository;
        this.reviewRepository = reviewRepository;
        this.userRepository = userRepository;
        this.commentParentRepository = commentParentRepository;
        this.reviewService = reviewService;
        this.productRepository = productRepository;
    }

    @Transactional
    public Comment createComment(CommentDTO commentDTO) {
        // 1. Find user by username
        Optional<User> userOptional = userRepository.findByUserUsername(commentDTO.username);
        if (userOptional.isEmpty()) {
            // If the user is not found, throw an exception
            throw new RuntimeException("User does not exist!");
        }
        User user = userOptional.get();
        // 2. Check if the user has created a review
        List<Review> reviewOptional = reviewRepository.findByUserAndProduct_ProductId(user, UUID.fromString(commentDTO.productId));
        Optional<Product> reProduct = productRepository.findById(UUID.fromString(commentDTO.productId));
        if (reProduct.isEmpty()) {
            throw new RuntimeException("Product not found with id: " + commentDTO.productId);
        }
        Product reviewProduct = reProduct.get();
        if (reviewOptional.isEmpty()) {
            // Nếu là ADMIN, tự động tạo review mặc định
            if (user.getRole().getId() == 1 || user.getRole().getId() == 3) {
                Review review = new Review();
                review.setUser(user);
                review.setOrder(null);
                review.setReviewRating(null);
                review.setProduct(reviewProduct);
                review.setComments(null);
                // Lưu vào DB và gán vào reviewOptional
                Review savedReview = reviewRepository.save(review);
                reviewOptional = List.of(savedReview);
            } else {
                throw new RuntimeException("User has not created a review!");
            }
        }

// Lấy review hiện có hoặc review vừa tạo cho ADMIN
        Review review = reviewOptional.get(reviewOptional.size() - 1);

        // 3. Create a new comment
        Comment newComment = new Comment();
        newComment.setReview(review);
        newComment.setCommentContent(commentDTO.comment.getCommentContent());
        // The created and updated timestamps are set automatically via @PrePersist in the entity
        Comment savedComment = commentRepository.save(newComment);

        // 4. If a parentCommentId is provided, create the relationship in the comment_parent table

        if (commentDTO.commentParentId != null) {
            CommentParent commentParent = new CommentParent();
            CommentParentId cpId = new CommentParentId();
            cpId.setCommentParentId(commentDTO.commentParentId);
            cpId.setCommentId(savedComment.getId());
            commentParent.setId(cpId);

            commentParentRepository.save(commentParent);
        }

        return savedComment;
    }



    /**
     * --- NEW SERVICE LOGIC FOR REPLIES ---
     * Adds a reply to a parent comment. Validation is simpler than a top-level review.
     */
    @Transactional
    public Comment addCommentReply(CommentDTO commentDTO, User user) {
        // Validation: Ensure the parent comment exists
        Comment parentComment = commentRepository.findById(commentDTO.getCommentParentId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Parent comment not found."));

        // A reply is still linked to the original Review. We find it via the parent comment.
        Review associatedReview = parentComment.getReview();
        if (associatedReview == null) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Could not find the original review associated with this comment thread.");
        }

        // The user who is replying is the one making the new comment.
        // We link this new comment to the same original review.
        Review reviewForReply = new Review();
        reviewForReply.setUser(user);
        reviewForReply.setProduct(associatedReview.getProduct());
        reviewForReply.setOrder(associatedReview.getOrder()); // Inherit the original order context
        Review savedReview = reviewRepository.save(reviewForReply);

        Comment newComment = new Comment();
        newComment.setReview(savedReview);
        newComment.setCommentContent(commentDTO.getComment().getCommentContent());

        Comment savedComment = commentRepository.save(newComment);

        // Link the new comment to its parent
        commentRepository.createCommentParentLink(savedComment.getId(), parentComment.getId());

        return savedComment;
    }





}
