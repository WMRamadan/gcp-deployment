import express from 'express'
import winston from 'winston'
import expressWinston from 'express-winston'

const app = express()
const PORT = 3000

app.use(
    expressWinston.logger({
        transports: [new winston.transports.Console()],
        meta: false,
        msg: 'HTTP  ',
        expressFormat: true,
        colorize: false,
        ignoreRoute: function (req, res) {
            return false
        }
    })
)

app.get('/', (req, res) => {
    res.send('You have successfully run the application!')
})

app.get('/sisutech/:userId', function (req, res) {
    res.send(req.params)
})

app.all('*', function (req, res, next) {
    res.send(req.params)
})

app.listen(PORT, () => {
    console.log(`Express server is listening at ${PORT}`)
})
