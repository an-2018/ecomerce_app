import users from "../../../database/users.json" assert {type: "json"}
import saveToDB from "../../../utils/db.js";

const create = (user) => {
    user.id = users.length + 1;

    users.push(user);
    saveToDB(users, "users");
    return user;
}

const findAll = () => {
    return users;
}

const findOne = (id) => {
    return users.find(user => user.id === Number(id))
}

const findByIdAndUpdate = async (id, data) => {
    const userUpdated = findOne(id)

    Object.assign(userUpdated, data)
    userUpdated.updatedAt = new Date().toISOString()
    
    users.map(user => user.id === Number(id) ? userUpdated : user)
    
    saveToDB(users, "users");
    return userUpdated
}

export default {
    create,
    findAll,
    findOne,
    findByIdAndUpdate
}