'use strict';
import express from 'express'
import productRoutes from './productRoute.js'

const router = express.Router()

router.route('/').get((req, res) => {
    res.send(`Wellcome to the NuSabom API!`);
})

router.use('/products', productRoutes)
//TODO: User routes - User wishlist, User comments, User orders, User reviews
router.use('/user', productRoutes)
//TODO: Chart routes
router.use('/cart', productRoutes)

export default router