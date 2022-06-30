import Cart from '../data/entities/Cart.js';
import cartStore from "../data/repository/cartStore.js"

export default class CartService {
    async create(data) {
        console.log("cart service", data)

        return cartStore.create(data)
    }

    async getAll() {
        return cartStore.findAll()
    }

    async getById(id) {
        return cartStore.findOne(id)
    }

    async addToCart(cartItem) {
        let cart = cartStore.findOne(cartItem.cartId)
        let isIn = false
        cart.items.forEach(item => {
            if (item.productId === cartItem.productId) {
                item.quantity += cartItem.quantity
                isIn = true
            }
        });

        if (!isIn) {
            cart.items.push(cartItem)
        }

        return cartStore.findByIdAndUpdate(cartItem.cartId, cart)
    }

    async update(id, data) {
        // TODO: update data
        return await cartStore.findByIdAndUpdate(id, data)
    }

    async delete(id) {
        // TODO: delete data
        return await Cart.findByIdAndDelete(id)
    }
}