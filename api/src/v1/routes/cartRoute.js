import express from 'express'
import CartController from '../controllers/cartController.js'

const router = express.Router()
const cartController = new CartController()

router.post('/', (req, res) => cartController.create(req, res))
router.get('/', (req, res) => cartController.getAll(req, res))
router.get('/:id', (req, res) => cartController.getById(req, res))
router.put('/:id', (req, res) => cartController.update(req, res))
router.delete('/:id', (req, res) => cartController.delete(req, res))
router.post('/add', (req, res) => cartController.addToCart(req, res))

export default router