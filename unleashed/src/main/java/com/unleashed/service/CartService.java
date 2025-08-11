package com.unleashed.service;

import com.unleashed.dto.CartDTO;
import com.unleashed.entity.Cart;
import com.unleashed.entity.User;
import com.unleashed.entity.Variation;
import com.unleashed.entity.composite.CartId;
import com.unleashed.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;

import java.util.List;
import java.util.UUID;

@Service
public class CartService {
    private final CartRepository cartRepository;
    private final VariationRepository variationRepository;
    private final StockVariationRepository stockVariationRepository;
    private final SaleRepository saleRepository;
    private final UserRepository userRepository;

    @Autowired
    public CartService(CartRepository cartRepository, VariationRepository variationRepository, StockVariationRepository stockVariationRepository, SaleRepository saleRepository, UserRepository userRepository) {
        this.cartRepository = cartRepository;
        this.variationRepository = variationRepository;
        this.stockVariationRepository = stockVariationRepository;
        this.saleRepository = saleRepository;
        this.userRepository = userRepository;
    }

    public LinkedMultiValueMap<String, CartDTO> getCartByUserId(String userid) {
        UUID userUuid = UUID.fromString(userid);
        List<Cart> userCart = cartRepository.findAllById_UserId(userUuid);

        List<CartDTO> cart = userCart.stream().map(uc ->
                        CartDTO.builder()
                                .variation(uc.getVariation())
                                .quantity(uc.getCartQuantity())
                                .build())
                .toList();

        cart.forEach(c -> {
            if (c.getVariation() != null) {
                c.setStockQuantity(stockVariationRepository.findStockProductByProductVariationId(c.getVariation().getId()));
                if (c.getVariation().getProduct() != null) {
                    // This now correctly passes a UUID to the repository method
                    c.setSale(saleRepository.findSaleByProductId(UUID.fromString(c.getVariation().getProduct().getProductId().toString())).orElse(null));
                }
            }
        });

        LinkedMultiValueMap<String, CartDTO> productList = new LinkedMultiValueMap<>();
        cart.forEach(v -> {
            if (v.getVariation() != null && v.getVariation().getProduct() != null) {
                productList.add(v.getVariation().getProduct().getProductName(), v);
            }
        });

        return productList;
    }

    public void addToCart(String userId, Integer variationId, Integer quantity) {
        UUID userUuid = UUID.fromString(userId);
        CartId cartId = CartId.builder()
                .userId(userUuid)
                .variationId(variationId)
                .build();

        Cart cart = cartRepository.findById(cartId).orElse(null);

        if (cart == null) {
            User user = userRepository.findById(userUuid).orElseThrow(() -> new NullPointerException("User not found"));
            Variation variation = variationRepository.findById(variationId).orElseThrow(() -> new NullPointerException("Variation not found"));

            cart = Cart.builder()
                    .id(cartId)
                    .user(user)
                    .variation(variation)
                    .cartQuantity(quantity)
                    .build();
        } else {
            cart.setCartQuantity(cart.getCartQuantity() + quantity);
        }
        cartRepository.save(cart);
    }

    public void removeFromCart(String userId, Integer variationId) {
        UUID userUuid = UUID.fromString(userId);
        cartRepository.findById(CartId
                .builder()
                .userId(userUuid)
                .variationId(variationId)
                .build()).ifPresentOrElse(cartRepository::delete,
                () -> {
                    throw new NullPointerException("Cart not found");
                });
    }

    public void removeAllFromCart(String userId) {
        UUID userUuid = UUID.fromString(userId);
        if (cartRepository.findAllById_UserId(userUuid).isEmpty()) {
            throw new NullPointerException("No items in cart");
        }
        cartRepository.deleteAllById_UserId(userUuid);
    }
}