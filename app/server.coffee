express = require 'express'
app = express()

app.get '/', require './controller/index.coffee'


server = app.listen process.env.PORT or 4040
