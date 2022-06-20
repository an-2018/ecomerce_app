'use strict';
import express from 'express'
import productRoutes from './productRoute.js'
import userRoutes from './userRoute.js'

const router = express.Router()

router.route('/').get((req, res) => {
    res.send(`Wellcome to the NuSabom API!`);
})

router.use('/products', productRoutes)
//TODO: User routes - User wishlist, User comments, User orders, User reviews
router.use('/users', userRoutes)
//TODO: Chart routes
router.use('/cart', productRoutes)

export default router