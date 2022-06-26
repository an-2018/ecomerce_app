import products from "../../../database/db.json" assert {type: "json"}
import saveToDB from "../../../utils/db.js";

const create = (product) => {
    product.id = products.length + 1;
    products.push(product);
    saveToDB(products)
    return product;
}

const findAll = ({ page = 1, limit = 10 }) => {
    console.log("page", page, "limit", limit)
    let list = []
    let startPosition = page * limit - limit
    for (let i = startPosition; i < products.length; i++) {
        if (list.length >= limit) {
            return list
        }
        list.push(products[i])
    }
    // return products.filter((index, value) => { console.log(value); return value < limit });
}

const findOne = (id) => {
    return products.find(product => product.id === id)
}

const filterBy = async (query) => {
    console.log(query)
    return await products.filter(
        (product) => {
            let result = []
            if (query.text) {
                result.push(
                    product.name.toLowerCase().includes(query.text.toLowerCase())
                    || product.description.toLowerCase().includes(query.text.toLowerCase())
                    || product.details.adjective.toLowerCase().includes(query.text.toLowerCase())
                )
            }
            if (query.hasDiscount) {
                result.push(product.hasDiscount === query.hasDiscount)
            }
            if (query.minPrice) {
                result.push(product.price >= query.minPrice)
            }
            if (query.maxPrice) {
                result.push(product.price <= query.maxPrice)
            }
            return result.reduce((acc, curr) => acc && curr)
        }
    )
}

export default {
    create,
    findAll,
    findOne,
    filterBy
}