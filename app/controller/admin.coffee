db = require '../db.coffee'
fs = require 'fs'
path = require 'path'
_ = require 'lodash'

view = _.template fs.readFileSync path.resolve './app/view/admin/index.html'



# db.query('select * from users').then console.log

module.exports = (req, res) ->
	db.tables().then (result) ->
		res.send view {
			message: 'admin only!!!' + Math.random()
			result: result
		}