import products from "./../../../database/db.json" assert {type: "json"}
import saveToDB from "../../../utils/db.js";

const create = (product) => {
    product.id = products.length + 1;
    products.push(product);
    saveToDB(products)
    return product;
}

const findAll = () => {
    return products;
}

const findOne = (id) => {
    return products.find(product => product.id === id)
}

export default {
    create,
    findAll,
    findOne
}