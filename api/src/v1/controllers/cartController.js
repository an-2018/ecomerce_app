import Cart from "../data/entities/Cart.js";
import CartItem from "../data/entities/CartItem.js";
import CartService from "../services/cartService.js";
import ProductService from "../services/productService.js";

export default class CartController {
    constructor() {
        this.cartService = new CartService();
        this.productService = new ProductService();
    }

    async create(req, res) {
        // TODO: add input validation
        try {
            const data = {
                userId: req.body.userId,
            }
            const newCart = await this.cartService.create(new Cart(data));
            res.status(201).json(newCart);
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async getAll(req, res) {
        // TODO: add input validation
        // TODO: add pagination
        try {
            const carts = await this.cartService.getAll();
            res.status(200).json({ carts: carts });
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async getById(req, res) {
        try {
            const id = Number(req.params.id)
            if (!id) {
                res.status(400).json({ error: "Invalid id" })
            }

            const cart = await this.cartService.getById(id);

            res.status(200).json(cart);
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async update(req, res) {
        try {
            const updatedCart = await this.cartService.updateUser(req.params.id, res.body);
            res.status(200).json(updatedCart);
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async addToCart(req, res) {
        try {
            const data = {
                cartId: req.body.cartId,
                productId: req.body.productId,
                quantity: req.body.quantity,
            }

            const product = await this.productService.getById(data.productId + "");
            data.product = product;

            const updatedCartItem = await this.cartService.addToCart(new CartItem(data));
            res.status(200).json(updatedCartItem);
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async delete(req, res) {
        try {
            this.cartService.delete(req.params.id);
            res.status(204).json();
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }
}
