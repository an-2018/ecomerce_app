import carts from "../../../database/carts.json" assert {type: "json"}
import saveToDB from "../../../utils/db.js";

const create = (cart) => {
    cart.id = carts.length + 1;
    console.log(cart)

    carts.push(cart);
    saveToDB(carts, "carts");
    return cart;
}

const findAll = () => {
    return carts;
}

const findOne = (id) => {
    return carts.find(cart => cart.id === Number(id))
}

const findByIdAndUpdate = async (id, data) => {
    const updated = findOne(id)

    Object.assign(updated, data)
    updated.updatedAt = new Date().toISOString()

    carts.map(cart => cart.id === Number(id) ? updated : cart)

    saveToDB(carts, "carts");
    return updated
}

export default {
    create,
    findAll,
    findOne,
    findByIdAndUpdate
}