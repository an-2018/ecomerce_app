'use strict';
export default class CartItem{
    constructor({id, cartId, productId, quantity, updatedAt}){
        this.id = id;
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt =  new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}