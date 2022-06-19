'use strict';
class Order{
    constructor(id, userId, cartId, total, createdAt, updatedAt){
        this.id = id;
        this.userId = userId;
        this.cartId = cartId;
        this.total = total;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}