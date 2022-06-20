'use strict';
export default class User {
    constructor({ id, name, email, password, createdAt, updatedAt }) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.wishlist = [];
        this.createdAt = new Date().toISOString();
        this.updatedAt = updatedAt;
    }
}