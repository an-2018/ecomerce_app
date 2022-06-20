import User from "../data/entities/User.js";
import UserService from "../services/userService.js";

export default class UserController {
    constructor() {
        this.userService = new UserService();
    }

    async create(req, res) {
        // TODO: add input validation
        try {
            const data = {
                name: req.body.name,
                email: req.body.email,
                password: req.body.password,
                wishlist: req.body.wishlist
            }
            const newUser = await this.userService.create(new User(data));
            res.status(201).json(newUser);
        } catch (err) {
            console.log(err)
            res.status(500).json({ error: err.message })
        }
    }

    async getAll(req, res) {
        // TODO: add input validation
        // TODO: add pagination
        try {
            const users = await this.userService.getAll();
            res.status(200).json({ users: users });
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

            const user = await this.userService.getById(id);

            res.status(200).json(user);
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async update(req, res) {
        try {
            const updatedUser = await this.userService.updateUser(req.params.id, res.body);
            res.status(200).json(updatedUser);
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }

    async delete(req, res) {
        try {
            this.userService.deleteUser(req.params.id);
            res.status(204).json();
        } catch (err) {
            res.status(500).json({ error: err.message })
        }
    }
}
