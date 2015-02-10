fs = require 'fs'
_ = require 'lodash'
path = require 'path'

view = _.template fs.readFileSync path.resolve './app/view/index.html'

challenges = fs.readdirSync './app/challenge'
challenges = _.uniq challenges.map (data)->
	data.substr 0, data.indexOf '.'
# console.log challenges


module.exports = (req, res, next) ->
	res.send view {
		challenges: challenges
	}
