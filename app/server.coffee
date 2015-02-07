express = require 'express'
parser = require 'body-parser'

app = express()

app.use parser.urlencoded {extended:true}
# app.use express.urlencoded()

app.get '/', require './controller/index.coffee'
app.get '/challenge/:name', require './controller/challenge.coffee'
app.post '/challenge/:name', require './controller/check.coffee'

app.use(express.static('./public'));


server = app.listen process.env.PORT or 4040
