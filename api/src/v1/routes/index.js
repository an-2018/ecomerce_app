'use strict';
import express from 'express'
import productRoutes from './productRoute.js'
import cartRoutes from './cartRoute.js'
import userRoutes from './userRoute.js'

const router = express.Router()

router.route('/').get((req, res) => {
    res.send(`Wellcome to the NuSabom API!`);
})

router.use('/products', productRoutes)
router.use('/users', userRoutes)
router.use('/carts', cartRoutes)
//TODO: User comments, User orders, User reviews

export default router