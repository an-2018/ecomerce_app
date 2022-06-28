import Product from "../data/entities/Product.js";
import ProductService from "./../services/productService.js";

export default class ProductController {
    constructor() {
        this.productService = new ProductService();
    }

    async create(req, res) {
        // TODO: add input validation
        try {
            const data = {
                name: req.body.name,
                price: req.body.price,
                description: req.body.description,
                gallery: req.body.gallery,
                discountValue: req.body.discountValue,
                details: req.body.details,
                hasDiscount: req.body.hasDiscount,
            }
            const newproduct = await this.productService.create(new Product(data));
            res.status(201).json(newproduct);
        } catch (err) {
            console.log(err.message)
            res.status(500).json({ error: err.message })
        }
    }

    async getAll(req, res) {
        // TODO: add input validation
        // TODO: add pagination
        const page = req.query.page || 1
        const limit = req.query.limit || 10
        try {
            const listPaginated = this.productService.list({ page })
            const { value } = await listPaginated.next()
            res.status(200).json({ products: value, page: page, limit: limit });
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async getById(req, res) {
        try {
            if (!Number(req.params.id)) {
                res.status(400).json({ error: "Invalid id" })
            }
            const product = await this.productService.getById(req.params.id);
            res.status(200).json(product);
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async update(req, res) {
        try {
            const updatedProduct = await this.productService.updateProduct(req.params.id, res.body);
            res.status(200).json(updatedProduct);
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async delete(req, res) {
        try {
            this.productService.deleteProduct(req.params.id);
            res.status(204).json();
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async search(req, res) {
        try {
            console.log(req.body)
            const searchQuery = {
                text: req.body.text,
                hasDiscount: req.body.hasDiscount,
                minPrice: req.body.minPrice,
                maxPrice: req.body.maxPrice
            }

            const result = await this.productService.search(searchQuery)
            console.log(result)
            res.status(200).json({ products: result });
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }
}
