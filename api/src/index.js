import express from 'express'
import router from './v1/routes/index.js'
import 'dotenv/config'
import cors from 'cors'

const app = express()
app.use(cors())
const PORT = process.env.PORT || 5000

app.use(express.json())
app.use('/', (req, res) => res.end("Hello, Wellcome!"))
app.use("/api/v1", router)

app.listen(PORT, () => {
    console.log(`server listen on ${PORT}`)
})