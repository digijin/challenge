fs = require 'fs'
_ = require 'lodash'
path = require 'path'
Sandbox = require 'sandbox'
test = require '../tester'
db = require '../db.coffee'
escape = require 'pg-escape'

view = _.template fs.readFileSync path.resolve './app/view/result.html'

module.exports = (req, res, next) ->
	name = req.params.name

	post = req.body
	console.log post
	test(post.code, name)
		.then (results) ->
			res.send view {
				post:post
				results: results
				message: 'challenge accepted!'
			}

	db.query escape "insert into submissions (data) values (%L)", post.code
		.then console.log 
