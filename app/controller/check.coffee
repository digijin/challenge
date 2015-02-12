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
	# console.log req.session
	# unless req.session.candidate 

	post = req.body
	test(post.code, name)
		.then (results) ->
			res.send view {
				post: post
				results: results
				message: 'challenge accepted!'
			}

			db.query escape "insert into submissions (data, challenge) values (%L, %L) returning id", post.code, name
				.then (out) ->
					console.log 'id', out.rows[0].id
