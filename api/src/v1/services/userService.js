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

    async update(id, data) {
        // TODO: update user
        return await User.findByIdAndUpdate(id, data)
    }

    async delete(id) {
        // TODO: delete product
        return await User.findByIdAndDelete(id)
    }
}