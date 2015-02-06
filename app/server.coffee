express = require 'express'
app = express()

app.get '/', require './controller/index.coffee'
app.get '/challenge/:name', require './controller/challenge.coffee'


server = app.listen process.env.PORT or 4040
