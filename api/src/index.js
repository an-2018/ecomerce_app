import express from 'express'
import router from './v1/routes/index.js'
import 'dotenv/config'

const app = express()

const PORT = process.env.PORT || 5000

app.use(express.json())
app.use("/api/v1", router)

app.listen(PORT, () => {
    console.log(`server listen on ${PORT}`)
})