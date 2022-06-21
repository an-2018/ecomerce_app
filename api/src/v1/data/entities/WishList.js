'use strict';
class wishlist{
    constructor({id, userId, productId, createdAt, updatedAt}){
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.createdAt = new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}