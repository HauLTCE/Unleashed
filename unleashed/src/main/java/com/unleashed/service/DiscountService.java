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
import jakarta.persistence.EntityNotFoundException;
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

    @Transactional
    public void performScheduledStatusUpdates() {
        DiscountStatus activeStatus = discountStatusRespository.findById(2)
                .orElseThrow(() -> new EntityNotFoundException("Critical: ACTIVE DiscountStatus not found."));
        DiscountStatus inactiveStatus = discountStatusRespository.findById(1)
                .orElseThrow(() -> new EntityNotFoundException("Critical: INACTIVE DiscountStatus not found."));
        DiscountStatus expiredStatus = discountStatusRespository.findById(3)
                .orElseThrow(() -> new EntityNotFoundException("Critical: EXPIRED DiscountStatus not found."));

        updateDiscountsToActive(inactiveStatus, activeStatus);
        updateDiscountsToInactiveOnUsage(activeStatus, inactiveStatus);
        updateDiscountsToExpired(expiredStatus);
    }

    private void updateDiscountsToActive(DiscountStatus inactiveStatus, DiscountStatus activeStatus) {
        OffsetDateTime now = OffsetDateTime.now();
        List<Discount> discountsToActivate = discountRepository
                .findByDiscountStatusAndDiscountStartDateBeforeAndDiscountEndDateAfter(inactiveStatus, now, now);

        if (!discountsToActivate.isEmpty()) {
            for (Discount discount : discountsToActivate) {
                if (discount.getDiscountUsageLimit() == null || discount.getDiscountUsageCount() < discount.getDiscountUsageLimit()) {
                    discount.setDiscountStatus(activeStatus);
                }
            }
            discountRepository.saveAll(discountsToActivate);
        }
    }

    private void updateDiscountsToInactiveOnUsage(DiscountStatus activeStatus, DiscountStatus inactiveStatus) {
        List<Discount> activeDiscounts = discountRepository.findByDiscountStatus(activeStatus);
        List<Discount> discountsToInactivate = new ArrayList<>();
        for (Discount discount : activeDiscounts) {
            if (discount.getDiscountUsageLimit() != null && discount.getDiscountUsageCount() >= discount.getDiscountUsageLimit()) {
                discountsToInactivate.add(discount);
            }
        }

        if (!discountsToInactivate.isEmpty()) {
            for (Discount discount : discountsToInactivate) {
                discount.setDiscountStatus(inactiveStatus);
            }
            discountRepository.saveAll(discountsToInactivate);
        }
    }

    private void updateDiscountsToExpired(DiscountStatus expiredStatus) {
        OffsetDateTime now = OffsetDateTime.now();
        List<Discount> discountsToExpire = discountRepository
                .findAllByDiscountEndDateBeforeAndDiscountStatusNot(now, expiredStatus);

        if (!discountsToExpire.isEmpty()) {
            for (Discount discount : discountsToExpire) {
                discount.setDiscountStatus(expiredStatus);
            }
            discountRepository.saveAll(discountsToExpire);
        }
    }

    private void setInitialDiscountStatus(Discount discount) {
        DiscountStatus activeStatus = discountStatusRespository.findById(2)
                .orElseThrow(() -> new EntityNotFoundException("Critical: ACTIVE DiscountStatus not found."));
        DiscountStatus inactiveStatus = discountStatusRespository.findById(1)
                .orElseThrow(() -> new EntityNotFoundException("Critical: INACTIVE DiscountStatus not found."));

        final OffsetDateTime now = OffsetDateTime.now();
        boolean isAlreadyStarted = !discount.getDiscountStartDate().isAfter(now);
        boolean isNotYetEnded = !discount.getDiscountEndDate().isBefore(now);

        if (isAlreadyStarted && isNotYetEnded) {
            discount.setDiscountStatus(activeStatus);
        } else {
            discount.setDiscountStatus(inactiveStatus);
        }
    }

    @Transactional
    public DiscountDTO addDiscount(DiscountDTO discountDTO) {
        if (discountDTO.getStartDate() != null && discountDTO.getEndDate() != null &&
                discountDTO.getStartDate().isAfter(discountDTO.getEndDate())) {
            throw new IllegalArgumentException("Start date cannot be after end date.");
        }

        Discount discount = convertToEntity(discountDTO);
        setInitialDiscountStatus(discount);
        discount.setDiscountUsageCount(0);
        discount.setDiscountCreatedAt(OffsetDateTime.now());

        return convertToDTO(discountRepository.save(discount));
    }

    @Transactional
    public Optional<DiscountDTO> updateDiscount(Integer discountId, DiscountDTO discountDTO) {
        return discountRepository.findById(discountId).map(existingDiscount -> {
            existingDiscount.setDiscountCode(discountDTO.getDiscountCode());
            existingDiscount.setDiscountValue(discountDTO.getDiscountValue());
            existingDiscount.setDiscountStartDate(discountDTO.getStartDate());
            existingDiscount.setDiscountEndDate(discountDTO.getEndDate());
            existingDiscount.setDiscountDescription(discountDTO.getDiscountDescription());
            existingDiscount.setDiscountMinimumOrderValue(discountDTO.getMinimumOrderValue());
            existingDiscount.setDiscountMaximumValue(discountDTO.getMaximumDiscountValue());
            existingDiscount.setDiscountUsageLimit(discountDTO.getUsageLimit());

            setInitialDiscountStatus(existingDiscount);

            existingDiscount.setDiscountUpdatedAt(OffsetDateTime.now(ZoneId.systemDefault()));

            return Optional.of(convertToDTO(discountRepository.save(existingDiscount)));
        }).orElse(Optional.empty());
    }

    @Transactional(readOnly = true)
    public List<DiscountDTO> getDiscountsByUserId(String userId) {
        List<UserDiscount> userDiscounts = userDiscountRepository.findAllById_UserId(UUID.fromString(userId));

        return userDiscounts.stream()
                .map(UserDiscount::getDiscount)
                .filter(discount -> "ACTIVE".equalsIgnoreCase(discount.getDiscountStatus().getDiscountStatusName()))
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public boolean isDiscountCodeExists(String discountCode) {
        return discountRepository.findByDiscountCode(discountCode).isPresent();
    }

    public Page<DiscountDTO> getAllDiscounts(String search, Integer statusId, Integer typeId, Pageable pageable) {
        Specification<Discount> spec = new DiscountSpecification(search, statusId, typeId, null);
        return discountRepository.findAll(spec, pageable).map(this::convertToDTO);
    }

    @Transactional(readOnly = true)
    public Page<DiscountDTO> getDiscountsForUser(String userId, String search, Integer statusId, Integer typeId, int page, int size, String sortBy, String sortOrder) {
        List<Integer> userDiscountIds = userDiscountRepository.findDiscountIdsByUserId(UUID.fromString(userId));

        if (userDiscountIds.isEmpty()) {
            return Page.empty(PageRequest.of(page, size));
        }

        Sort finalSort;
        if ("amount".equalsIgnoreCase(sortBy)) {
            Sort.Direction direction = "desc".equalsIgnoreCase(sortOrder) ? Sort.Direction.DESC : Sort.Direction.ASC;
            finalSort = Sort.by(new Sort.Order(direction, "discountValue"));
        } else {
            finalSort = Sort.by(
                    Sort.Order.asc("discountStatus.id"),
                    Sort.Order.asc("discountEndDate")
            );
        }

        Pageable pageable = PageRequest.of(page, size, finalSort);

        Specification<Discount> spec = new DiscountSpecification(search, statusId, typeId, userDiscountIds);

        return discountRepository.findAll(spec, pageable).map(this::convertToDTO);
    }

    @Transactional(readOnly = true)
    public Optional<DiscountDTO> getDiscountForUserById(Integer discountId, String userId) {
        boolean isAssigned = userDiscountRepository.existsById_UserIdAndId_DiscountId(UUID.fromString(userId), discountId);

        if (!isAssigned) {
            return Optional.empty();
        }

        return discountRepository.findById(discountId).map(this::convertToDTO);
    }

    public Optional<DiscountDTO> getDiscountById(int discountId) {
        return discountRepository.findById(discountId).map(this::convertToDTO);
    }

    @Transactional(readOnly = true)
    public List<DiscountStatus> findAllStatuses() {
        return discountStatusRespository.findAll();
    }

    @Transactional(readOnly = true)
    public List<DiscountType> findAllTypes() {
        return discountTypeRepository.findAll();
    }

    public Optional<DiscountDTO> findDiscountByCode(String discountCode) {
        return discountRepository.findByDiscountCode(discountCode).map(this::convertToDTO);
    }

    public Optional<DiscountDTO> endDiscount(int discountId) {
        return discountRepository.findById(discountId).map(discount -> {
            discount.setDiscountStatus(discountStatusRespository.getReferenceById(1)); // 1 = INACTIVE
            return convertToDTO(discountRepository.save(discount));
        });
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
                UserDiscountId userDiscountId = new UserDiscountId(discount.getDiscountId(), user.getUserId());
                UserDiscount userDiscount = new UserDiscount(userDiscountId, discount, user, false, null);
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
        userDiscountRepository.findById_UserIdAndId_DiscountId(userUuid, discountId)
                .ifPresent(userDiscountRepository::delete);
    }

    public Map<String, Object> getUsersByDiscountId(Integer discountId) {
        List<UserDiscount> userDiscounts = userDiscountRepository.findAllById_DiscountId(discountId);
        Set<UUID> allowedUserIds = userDiscounts.stream()
                .map(userDiscount -> userDiscount.getId().getUserId())
                .collect(Collectors.toSet());
        List<DiscountUserViewDTO> users = userDiscounts.stream()
                .map(userDiscount -> userRepository.findById(userDiscount.getId().getUserId())
                        .map(user -> new DiscountUserViewDTO(user.getUserId().toString(), user.getUserUsername(), user.getUserEmail(), user.getUserFullname(), user.getUserImage()))
                        .orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        Map<String, Object> result = new HashMap<>();
        result.put("users", users);
        result.put("allowedUserIds", allowedUserIds);
        return result;
    }

    public ResponseEntity<?> checkUserDiscount(String discountCode, BigDecimal subTotal) {
        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
        }
        if (currentUsername == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new ResponseDTO(HttpStatus.UNAUTHORIZED.value(), "User not authenticated"));
        }
        UUID userId = userRepository.findByUserUsername(currentUsername).map(User::getUserId).orElse(null);
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "User ID not found for authenticated user"));
        }
        Optional<DiscountDTO> discountOpt = findDiscountByCode(discountCode);
        if (discountOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "Discount code not found"));
        }
        Map<String, Object> discountUsersData = getUsersByDiscountId(discountOpt.get().getDiscountId());
        Set<UUID> allowedUserIds = (Set<UUID>) discountUsersData.get("allowedUserIds");
        if (!allowedUserIds.contains(userId)) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(new ResponseDTO(HttpStatus.FORBIDDEN.value(), "User is not available for this discount"));
        }
        boolean hasDiscount = checkDiscountUsage(userId.toString(), discountCode);
        if (!hasDiscount) {
            DiscountDTO discountDTO = discountOpt.get();
            if (!"ACTIVE".equalsIgnoreCase(discountDTO.getDiscountStatus().getDiscountStatusName())) {
                return ResponseEntity.status(HttpStatus.GONE).body(new ResponseDTO(HttpStatus.GONE.value(), "Discount is not active."));
            }
            if (discountDTO.getMinimumOrderValue() != null && discountDTO.getMinimumOrderValue().compareTo(subTotal) <= 0) {
                return ResponseEntity.ok(discountDTO);
            } else if (discountDTO.getMinimumOrderValue() == null) {
                return ResponseEntity.ok(discountDTO);
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ResponseDTO(HttpStatus.BAD_REQUEST.value(), "The minimum order value is " + decimalFormat.format(discountDTO.getMinimumOrderValue()) + ". Please add more items to your cart."));
            }
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponseDTO(HttpStatus.NOT_FOUND.value(), "User used this discount"));
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
        UserDiscount userDiscount = userDiscountRepository.findById_UserIdAndId_DiscountId(UUID.fromString(userId), discount.getDiscountId())
                .orElseThrow(() -> new IllegalStateException("User has not been assigned this discount."));
        if (userDiscount.getIsDiscountUsed()) {
            throw new IllegalStateException("User has already used this discount.");
        }
        userDiscount.setIsDiscountUsed(true);
        userDiscount.setDiscountUsedAt(OffsetDateTime.now());
        userDiscountRepository.save(userDiscount);
        discount.setDiscountUsageCount(discount.getDiscountUsageCount() + 1);
        if (discount.getDiscountUsageLimit() != null && discount.getDiscountUsageLimit().equals(discount.getDiscountUsageCount())) {
            DiscountStatus inactiveDiscountStatus = discountStatusRespository.findByDiscountStatusName("INACTIVE");
            if (inactiveDiscountStatus != null) {
                discount.setDiscountStatus(inactiveDiscountStatus);
            }
        }
        discountRepository.save(discount);
    }

    public DiscountDTO convertToDTO(Discount discount) {
        if (discount == null) {
            return null;
        }

        DiscountDTO dto = new DiscountDTO();
        dto.setDiscountId(discount.getDiscountId());
        dto.setDiscountCode(discount.getDiscountCode());
        dto.setDiscountType(discount.getDiscountType());
        dto.setDiscountValue(discount.getDiscountValue());
        dto.setStartDate(discount.getDiscountStartDate());
        dto.setEndDate(discount.getDiscountEndDate());
        dto.setDiscountStatus(discount.getDiscountStatus());
        dto.setDiscountDescription(discount.getDiscountDescription());
        dto.setMinimumOrderValue(discount.getDiscountMinimumOrderValue());
        dto.setMaximumDiscountValue(discount.getDiscountMaximumValue());
        dto.setUsageLimit(discount.getDiscountUsageLimit());
        dto.setRank(discount.getDiscountRankRequirement());
        dto.setUsageCount(discount.getDiscountUsageCount());

        if (discount.getDiscountType() != null) {
            dto.setDiscountTypeName(discount.getDiscountType().getDiscountTypeName());
        }

        if (discount.getDiscountStatus() != null) {
            dto.setDiscountStatusName(discount.getDiscountStatus().getDiscountStatusName());
        }

        if (discount.getDiscountRankRequirement() != null) {
            dto.setRankName(discount.getDiscountRankRequirement().getRankName());
        } else {
            dto.setRankName("All Ranks");
        }

        return dto;
    }

    private Discount convertToEntity(DiscountDTO discountDTO) {
        Discount discount = new Discount();
        if (discountDTO.getDiscountId() != null) {
            discount.setDiscountId(discountDTO.getDiscountId());
        }
        discount.setDiscountCode(discountDTO.getDiscountCode());
        discount.setDiscountValue(discountDTO.getDiscountValue());
        discount.setDiscountStartDate(discountDTO.getStartDate());
        discount.setDiscountEndDate(discountDTO.getEndDate());

        if (discountDTO.getDiscountStatus() != null) {
            DiscountStatus discountStatus = discountStatusRespository.findById(discountDTO.getDiscountStatus().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("DiscountStatus not found"));
            discount.setDiscountStatus(discountStatus);
        }

        if (discountDTO.getDiscountType() != null) {
            DiscountType discountType = discountTypeRepository.findById(discountDTO.getDiscountType().getId())
                    .orElseThrow(() -> new ResourceNotFoundException("DiscountType not found"));
            discount.setDiscountType(discountType);
        }

        if (discountDTO.getRank() != null && discountDTO.getRank().getId() != null) {
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