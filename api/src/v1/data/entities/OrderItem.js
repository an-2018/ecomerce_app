'use strict';
class OrderItem{
    constructor(id, orderId, productId, quantity, createdAt, updatedAt){
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}