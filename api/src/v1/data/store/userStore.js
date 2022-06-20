import users from "../../../database/users.json" assert {type: "json"}
import saveToDB from "../../../utils/db.js";

const create = (user) => {
    user.id = users.length + 1;
    console.log(user)

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

export default {
    create,
    findAll,
    findOne
}