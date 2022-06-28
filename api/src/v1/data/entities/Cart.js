'use strict';
export default class Cart {
    constructor({ id, userId, updatedAt }) {
        this.id = id;
        this.userId = userId;
        this.items = [];
        this.createdAt = new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}