fs = require 'fs'
_ = require 'lodash'
path = require 'path'

view = _.template fs.readFileSync path.resolve './app/view/challenge.html'


files = fs.readdirSync path.resolve './app/challenge'
challenges = {}
specs = {}
files.forEach (file) ->
	
	base = file.substr 0, file.indexOf '.'
	if file.indexOf('spec') >-1
		# specs[base] = obj
	else
		obj = require '../challenge/'+file
		challenges[base] = obj

module.exports = (req, res, next) ->
	name = req.params.name
	challenge = challenges[name]

	# console.log challenges, name
	res.send view {
		name: name
		challenge: challenge
	}
