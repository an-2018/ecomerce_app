'use strict';
class Comment extends Feedback{
    constructor({id, userId, productId, comment, createdAt, updatedAt}){
        super({id, userId,productId, feedback:comment, createdAt, updatedAt});
    }
}