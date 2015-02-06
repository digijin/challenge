express = require 'express'
app = express()

app.get '/', require './controller/index.coffee'
app.get '/challenge/:name', require './controller/challenge.coffee'
app.post '/challenge/:name', require './controller/check.coffee'


server = app.listen process.env.PORT or 4040
