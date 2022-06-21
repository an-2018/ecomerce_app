import User from '../data/entities/User.js';
import userStore from "../data/store/userStore.js"

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
        if (user.wishlist.includes(data.productId)) {
            return { error: "Product already in wishlist" }
        }
        user.wishlist.push(data.productId)
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