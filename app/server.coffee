express = require 'express'
parser = require 'body-parser'
session = require 'express-session'

app = express()
app.use session
	secret: 'yolo'
	resave: true
	saveUninitialized: true
app.use parser.urlencoded {extended:true}
# app.use express.urlencoded()

app.get '/', require './controller/index.coffee'
app.get '/challenge/:name', require './controller/challenge.coffee'
app.post '/challenge/:name', require './controller/check.coffee'

app.get '/admin', require './controller/admin.coffee'
app.get '/admin/:tablename', require './controller/admin/list.coffee'

app.use(express.static('./public'));


server = app.listen process.env.PORT or 4040
