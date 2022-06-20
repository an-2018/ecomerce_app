import express from 'express'
import ProductController from './../controllers/productController.js'

const router = express.Router()
const productController = new ProductController()

router.post('/', (req, res) => productController.create(req, res))
router.get('/', (req, res) => productController.getAll(req, res))
router.post('/search', (req, res) => productController.search(req, res))
router.get('/:id', (req, res) => productController.getById(req, res))
router.put('/:id', (req, res) => productController.update(req, res))
router.delete('/:id', (req, res) => productController.delete(req, res))

export default router