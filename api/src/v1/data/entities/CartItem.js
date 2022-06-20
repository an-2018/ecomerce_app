'use strict';
class CartItem{
    constructor({id, cartId, productId, quantity, createdAt, updatedAt}){
        this.id = id;
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}