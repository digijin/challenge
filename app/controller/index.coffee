fs = require 'fs'
_ = require 'lodash'
path = require 'path'

view = _.template fs.readFileSync path.resolve './app/view/index.html'

module.exports = (req, res, next) ->
	res.send view()
