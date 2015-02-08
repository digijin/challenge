db = require '../../db.coffee'
fs = require 'fs'
path = require 'path'
_ = require 'lodash'

view = _.template fs.readFileSync path.resolve './app/view/admin/list.html'

module.exports = (req, res) ->
	# console.log req.params.tablename
	table = req.params.tablename
	db.query "select * from #{table}"
		.then (data) ->
			res.send view {
				data: data
			}