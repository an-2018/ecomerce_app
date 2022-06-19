'use strict';
class Review extends Feedback{
    constructor({id, userId, productId, rating, comment, createdAt, updatedAt}){
        super({id, userId, productId, feedback:comment, createdAt, updatedAt});
        this.rating = rating;
    }
}