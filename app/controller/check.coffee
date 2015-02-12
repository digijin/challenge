fs = require 'fs'
_ = require 'lodash'
path = require 'path'
Sandbox = require 'sandbox'
test = require '../tester'
db = require '../db.coffee'

submissions = require '../model/submissions'
results = require '../model/results'

view = _.template fs.readFileSync path.resolve './app/view/result.html'

module.exports = (req, res, next) ->
	name = req.params.name
	# console.log req.session
	# unless req.session.candidate 

	post = req.body
	test(post.code, name)
		.then (out) ->
			res.send view {
				post: post
				results: out
				message: 'challenge accepted!'
			}

			# console.log submissions

			submissions.insert
				data: post.code
				challenge: name
			.then (id) ->
				# console.log "challenge id", id
				out.forEach (res) ->
					res.submission_id = id
					results.insert res

