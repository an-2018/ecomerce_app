import Product from './../data/entities/Product.js';
import productStore from "../data/repository/productStore.js"

export default class ProductService {
    async *list({ page, limit }) {
        while (true) {
            const data = productStore.findAll({ page, limit })
            yield data
            page += 1;
        }
    }

    async create(data) {
        return productStore.create(data)
    }

    async getAll() {
        return productStore.findAll({})
    }

    async getById(id) {
        return productStore.findOne(id)
    }

    async update(id, data) {
        // TODO: update product
        return await Product.findByIdAndUpdate(id, data)
    }

    async delete(id) {
        // TODO: delete product
        return await Product.findByIdAndDelete(id)
    }

    async search(query) {
        return await productStore.filterBy(query)
    }
}