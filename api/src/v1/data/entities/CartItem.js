'use strict';
export default class CartItem {
    constructor({ id, cartId, productId, product, quantity, updatedAt }) {
        this.id = id;
        this.cartId = cartId;
        this.productId = productId;
        this.product = product;
        this.quantity = quantity;
        this.createdAt = new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}