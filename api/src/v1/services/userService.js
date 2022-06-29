import User from '../data/entities/User.js';
import userStore from "../data/repository/userStore.js"

export default class UserService {
    async create(data) {
        console.log("service", data)

        return userStore.create(data)
    }

    async getAll() {
        return userStore.findAll()
    }

    async getById(id) {
        return userStore.findOne(id)
    }

    async addWishList(data) {
        const user = userStore.findOne(data.userId)
        let isIn = false
        user.wishlist.forEach(item => {
            if (Number(item.id) === Number(data.productId)) {
                isIn = true
                console.log("is in")
            }
        });
        console.log(isIn)
        if (!isIn) {
            user.wishlist.push(data.product)
        }
        return userStore.findByIdAndUpdate(data.userId, user)
    }

    async update(id, data) {
        // TODO: update user
        return await userStore.findByIdAndUpdate(id, data)
    }

    async delete(id) {
        // TODO: delete product
        return await User.findByIdAndDelete(id)
    }
}