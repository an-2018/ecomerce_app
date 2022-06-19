'use strict';
export default class Product {
    constructor({ id, name, price, description, gallery, details, discountValue, hasDiscount, category, updatedAt }) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.gallery = gallery;
        this.category = category;
        this.details = details;
        this.discountValue = discountValue;
        this.hasDiscount = hasDiscount;
        this.createdAt = new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}