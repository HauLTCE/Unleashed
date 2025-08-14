package com.unleashed.service;

import com.unleashed.dto.DiscountDTO;
import com.unleashed.dto.DiscountUserViewDTO;
import com.unleashed.dto.ResponseDTO;
import com.unleashed.dto.mapper.UserMapper;
import com.unleashed.entity.*;
import com.unleashed.entity.composite.UserDiscountId;
import com.unleashed.repo.*;
import com.unleashed.repo.specification.DiscountSpecification;
import com.unleashed.util.JwtUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class DiscountService {

    private static final Logger logger = LoggerFactory.getLogger(DiscountService.class);
    private final DiscountRepository discountRepository;
    private final UserDiscountRepository userDiscountRepository;
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final JwtUtil jwtUtil;
    private final DiscountStatusRespository discountStatusRespository;
    private final DiscountTypeRepository discountTypeRepository;
    private final RankRepository rankRepository;


    @Autowired
    public DiscountService(DiscountRepository discountRepository,
                           UserDiscountRepository userDiscountRepository,
                           UserRepository userRepository,
                           JwtUtil jwtUtil,
                           UserMapper userMapper, DiscountStatusRespository discountStatusRespository, DiscountTypeRepository discountTypeRepository, RankRepository rankRepository) {
        this.discountRepository = discountRepository;
        this.userDiscountRepository = userDiscountRepository;
        this.userRepository = userRepository;
        this.userMapper = userMapper;
        this.jwtUtil = jwtUtil;
        this.discountStatusRespository = discountStatusRespository;
        this.discountTypeRepository = discountTypeRepository;
        this.rankRepository = rankRepository;
    }

    public boolean isDiscountCodeExists(String discountCode) {
        return discountRepository.findByDiscountCode(discountCode).isPresent();
    }

    public Page<DiscountDTO> getAllDiscounts(String search, Integer statusId, Integer typeId, Pageable pageable) {
        Specification<Discount> spec = new DiscountSpecification(search, statusId, typeId);
        return discountRepository.findAll(spec, pageable).map(this::convertToDTO);
    }

    public Optional<DiscountDTO> getDiscountById(int discountId) {
        return discountRepository.findById(discountId).map(this::convertToDTO);
    }

    /**
     * Finds all available discount statuses.
     * @return A list of all DiscountStatus entities.
     */
    @Transactional(readOnly = true)
    public List<DiscountStatus> findAllStatuses() {
        return discountStatusRespository.findAll();
    }

    /**
     * Finds all available discount types.
     * @return A list of all DiscountType entities.
     */
    @Transactional(readOnly = true)
    public List<DiscountType> findAllTypes() {
        return discountTypeRepository.findAll();
    }

    @Transactional
    public DiscountDTO addDiscount(DiscountDTO discountDTO) {
        DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
        if (discountDTO.getStartDate() != null && discountDTO.getEndDate() != null &&
                discountDTO.getStartDate().isAfter(discountDTO.getEndDate())) {
            throw new IllegalArgumentException("Start date cannot be after end date.");
        }

        if (discountDTO.getEndDate().isBefore(OffsetDateTime.now()) || discountDTO.getStartDate().isAfter(OffsetDateTime.now())) {
            discountDTO.setDiscountStatus(inactiveDiscountStatus);
        }

        if (discountDTO.getUsageCount() == null) {
            discountDTO.setUsageCount(0);
        }

        Discount discount = convertToEntity(discountDTO);

        return convertToDTO(discountRepository.save(discount));
    }

    @Transactional
    public Optional<DiscountDTO> updateDiscount(Integer discountId, DiscountDTO discountDTO) {
        Optional<Discount> discountOpt = discountRepository.findById(discountId);
        DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
        if (discountOpt.isPresent()) {
            Discount updatedDiscount = convertToEntity(discountDTO);
            updatedDiscount.setDiscountId(discountId);

            if (discountOpt.get().getDiscountCreatedAt() != null) {
                updatedDiscount.setDiscountCreatedAt(discountOpt.get().getDiscountCreatedAt());
            }

            updatedDiscount.setDiscountUpdatedAt(OffsetDateTime.now(ZoneId.systemDefault()));


            if (discountOpt.get().getDiscountEndDate().isBefore(OffsetDateTime.now()) || discountOpt.get().getDiscountStartDate().isAfter(OffsetDateTime.now())) {
                updatedDiscount.setDiscountStatus(inactiveDiscountStatus);
            }

            return Optional.of(convertToDTO(discountRepository.save(updatedDiscount)));
        }
        return Optional.empty();
    }

    public Optional<DiscountDTO> findDiscountByCode(String discountCode) {
        return discountRepository.findByDiscountCode(discountCode).map(this::convertToDTO);
    }

    public Optional<DiscountDTO> endDiscount(int discountId) {
        Optional<Discount> discount = discountRepository.findById(discountId);
        if (discount.isPresent()) {
            discount.get().setDiscountStatus(discountStatusRespository.getReferenceById(1));
            return Optional.of(convertToDTO(discountRepository.save(discount.get())));
        }
        return Optional.empty();
    }

    @Transactional
    public void deleteDiscount(int discountId) {
        discountRepository.deleteById(discountId);
    }

    public boolean checkDiscountUsage(String userId, String discountCode) {
        Optional<Discount> discountOpt = discountRepository.findByDiscountCode(discountCode);
        if (discountOpt.isEmpty()) {
            throw new IllegalArgumentException("Discount code not found.");
        }

        Discount discount = discountOpt.get();

        if (discount.getDiscountUsageLimit() != null && discount.getDiscountUsageCount() >= discount.getDiscountUsageLimit()) {
            throw new IllegalStateException("This discount has been fully used by all users.");
        }
        return userDiscountRepository
                .findById_UserIdAndId_DiscountId(UUID.fromString(userId), discount.getDiscountId())
                .map(UserDiscount::getIsDiscountUsed)
                .orElse(false);
    }


    @Transactional
    public void addUsersToDiscount(List<String> userIds, Integer discountId) {
        Discount discount = discountRepository.findById(discountId)
                .orElseThrow(() -> new ResourceNotFoundException("Discount not found."));

        List<UserDiscount> userDiscounts = new ArrayList<>();

        for (String userIdStr : userIds) {
            UUID userUuid = UUID.fromString(userIdStr);
            if (!userDiscountRepository.existsById_UserIdAndId_DiscountId(userUuid, discountId)) {
                User user = userRepository.findById(userUuid)
                        .orElseThrow(() -> new ResourceNotFoundException("User not found with ID: " + userIdStr));

                UserDiscountId userDiscountId = new UserDiscountId();
                userDiscountId.setUserId(user.getUserId());
                userDiscountId.setDiscountId(discount.getDiscountId());

                UserDiscount userDiscount = new UserDiscount();
                userDiscount.setId(userDiscountId);
                userDiscount.setIsDiscountUsed(false);
                userDiscount.setUser(user); // Set the User object
                userDiscount.setDiscount(discount); // Set the Discount object

                userDiscounts.add(userDiscount);
            }
        }

        if (!userDiscounts.isEmpty()) {
            userDiscountRepository.saveAll(userDiscounts);
        }
    }


    @Transactional
    public void removeUserFromDiscount(String userId, Integer discountId) {
        UUID userUuid = UUID.fromString(userId);
        Optional<UserDiscount> userDiscountOpt = userDiscountRepository.findById_UserIdAndId_DiscountId(userUuid, discountId);
        userDiscountOpt.ifPresent(userDiscountRepository::delete);
    }

    @Transactional
    public List<DiscountDTO> getDiscountsByUserId(String userId) {
        List<UserDiscount> userDiscounts = userDiscountRepository.findAllById_UserId(UUID.fromString(userId));

        return userDiscounts.stream()
                .map(userDiscount -> {
                    Discount discount = discountRepository.findById(userDiscount.getId().getDiscountId())
                            .orElse(null);

                    if (discount == null) {
                        return null;
                    }

                    if (discount.getDiscountStatus().getDiscountStatusName().equalsIgnoreCase("EXPIRED") ||
                            discount.getDiscountStatus().getDiscountStatusName().equalsIgnoreCase("INACTIVE")) {
                        return null;
                    }

                    if (discount.getDiscountEndDate().isBefore(OffsetDateTime.now()) || discount.getDiscountStartDate().isAfter(OffsetDateTime.now())) {
                        DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
                        if (inactiveDiscountStatus != null) {
                            discount.setDiscountStatus(inactiveDiscountStatus);
                        }
                        return null;
                    }

                    return convertToDTO(discount);
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }


    public Map<String, Object> getUsersByDiscountId(Integer discountId) {
        List<UserDiscount> userDiscounts = userDiscountRepository.findAllById_DiscountId(discountId);
        Set<UUID> allowedUserIds = userDiscounts.stream()
                .map(userDiscount -> userDiscount.getId().getUserId())
                .collect(Collectors.toSet());

        List<DiscountUserViewDTO> users = userDiscounts.stream()
                .map(userDiscount -> userRepository.findById(userDiscount.getId().getUserId())
                        .map(user -> new DiscountUserViewDTO(
                                user.getUserId().toString(),
                                user.getUserUsername(),
                                user.getUserEmail(),
                                user.getUserFullname(),
                                user.getUserImage()
                        ))
                        .orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        Map<String, Object> result = new HashMap<>();
        result.put("users", users);
        result.put("userDiscounts", userDiscounts);
        result.put("allowedUserIds", allowedUserIds);

        return result;
    }

    public ResponseEntity<?> checkUserDiscount(String discountCode, BigDecimal subTotal) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = null;
        DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
        }

        if (currentUsername == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new ResponseDTO(HttpStatus.UNAUTHORIZED.value(), "User not authenticated"));
        }

        UUID userId = userRepository.findByUserUsername(currentUsername)
                .map(User::getUserId)
                .orElse(null);
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "User ID not found for authenticated user"));
        }

        Optional<DiscountDTO> discountOpt = findDiscountByCode(discountCode);
        if (discountOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "Discount code not found"));
        }

        Map<String, Object> discountUsersData = getUsersByDiscountId(discountOpt.get().getDiscountId());
        Set<UUID> allowedUserIds = (Set<UUID>) discountUsersData.get("allowedUserIds");

        if (!allowedUserIds.contains(userId)) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new ResponseDTO(HttpStatus.FORBIDDEN.value(), "User is not available for this discount"));
        }

        boolean hasDiscount = checkDiscountUsage(userId.toString(), discountCode);
        if (!hasDiscount) {
            DiscountDTO discountDTO = discountOpt.get();
            if (discountDTO.getEndDate().isBefore(OffsetDateTime.now()) || discountDTO.getStartDate().isAfter(OffsetDateTime.now())) {
                discountDTO.setDiscountStatus(inactiveDiscountStatus);
            }
            if (Objects.equals(discountDTO.getDiscountStatus().getDiscountStatusName(), "EXPIRED")) {
                return ResponseEntity.status(HttpStatus.GONE).body(new ResponseDTO(HttpStatus.GONE.value(), "Discount expired"));
            }
            if (Objects.equals(discountDTO.getDiscountStatus().getDiscountStatusName(), "INACTIVE")) {
                return ResponseEntity.status(HttpStatus.GONE).body(new ResponseDTO(HttpStatus.GONE.value(), "Discount has reached the limit or INACTIVE! Try another discount."));
            }
            if (discountDTO.getMinimumOrderValue() != null && discountDTO.getMinimumOrderValue().compareTo(subTotal) <= 0) {
                return ResponseEntity.ok(discountDTO);
            } else if (discountDTO.getMinimumOrderValue() == null) {
                return ResponseEntity.ok(discountDTO);
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
                        new ResponseDTO(HttpStatus.BAD_REQUEST.value(), "The minimum order value is " + decimalFormat.format(discountDTO.getMinimumOrderValue()) + ". Please add more items to your cart.")
                );
            }
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "User used this discount"));
        }
    }

    @Transactional
    public void updateUsageLimit(String discountCode, String userId) {
        Optional<Discount> discountOpt = discountRepository.findByDiscountCode(discountCode);
        if (discountOpt.isEmpty()) {
            throw new IllegalArgumentException("Discount code not found.");
        }

        Discount discount = discountOpt.get();

        if (discount.getDiscountUsageLimit() != null && discount.getDiscountUsageCount() >= discount.getDiscountUsageLimit()) {
            throw new IllegalStateException("This discount has been fully used.");
        }

        UserDiscount userDiscount = userDiscountRepository
                .findById_UserIdAndId_DiscountId(UUID.fromString(userId), discount.getDiscountId())
                .orElseThrow(() -> new IllegalStateException("User has not been assigned this discount."));

        if (userDiscount.getIsDiscountUsed()) {
            throw new IllegalStateException("User has already used this discount.");
        }

        userDiscount.setIsDiscountUsed(true);
        userDiscount.setDiscountUsedAt(OffsetDateTime.now());
        userDiscountRepository.save(userDiscount);

        if (discount.getDiscountUsageCount() < discount.getDiscountUsageLimit()) {
            discount.setDiscountUsageCount(discount.getDiscountUsageCount() + 1);
            if (discount.getDiscountUsageLimit().equals(discount.getDiscountUsageCount())) {
                DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
                if (inactiveDiscountStatus != null) {
                    discount.setDiscountStatus(inactiveDiscountStatus);
                }
            }
        }

        discountRepository.save(discount);
    }


    public DiscountDTO convertToDTO(Discount discount) {
        return new DiscountDTO(
                discount.getDiscountId(),
                discount.getDiscountCode(),
                discount.getDiscountType(),
                discount.getDiscountValue(),
                discount.getDiscountStartDate(),
                discount.getDiscountEndDate(),
                discount.getDiscountStatus(),
                discount.getDiscountDescription(),
                discount.getDiscountMinimumOrderValue(),
                discount.getDiscountMaximumValue(),
                discount.getDiscountUsageLimit(),
                discount.getDiscountRankRequirement(),
                discount.getDiscountUsageCount()
        );
    }


    private Discount convertToEntity(DiscountDTO discountDTO) {
        Discount discount = new Discount();
        discount.setDiscountCode(discountDTO.getDiscountCode());
        discount.setDiscountValue(discountDTO.getDiscountValue());
        discount.setDiscountStartDate(discountDTO.getStartDate());
        discount.setDiscountEndDate(discountDTO.getEndDate());

        DiscountStatus discountStatus = discountStatusRespository.findById(discountDTO.getDiscountStatus().getId())
                .orElseThrow(() -> new ResourceNotFoundException("DiscountStatus not found"));
        discount.setDiscountStatus(discountStatus);

        DiscountType discountType = discountTypeRepository.findById(discountDTO.getDiscountType().getId())
                .orElseThrow(() -> new ResourceNotFoundException("DiscountType not found"));
        discount.setDiscountType(discountType);

        if (discountDTO.getRank() != null) {
            Rank rank = rankRepository.findById(discountDTO.getRank().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("Rank not found"));
            discount.setDiscountRankRequirement(rank);
        }

        discount.setDiscountDescription(discountDTO.getDiscountDescription());
        discount.setDiscountMinimumOrderValue(discountDTO.getMinimumOrderValue());
        discount.setDiscountMaximumValue(discountDTO.getMaximumDiscountValue());
        discount.setDiscountUsageLimit(discountDTO.getUsageLimit());
        discount.setDiscountUsageCount(discountDTO.getUsageCount());
        return discount;
    }
}