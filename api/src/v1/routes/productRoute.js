import express from 'express'
import ProductController from './../controllers/productController.js'

const router = express.Router()
const productController = new ProductController()

router.post('/', (req, res) => productController.createProduct(req, res))
router.get('/', (req, res) => productController.getAllProducts(req, res))
router.get('/:id', (req, res) => productController.getProductById(req, res))
router.put('/:id', productController.updateProduct)
router.delete('/:id', productController.deleteProduct)

export default router