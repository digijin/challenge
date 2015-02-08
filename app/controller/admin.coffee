db = require '../db.coffee'

module.exports = (req, res) ->
	res.send 'admin only!!!' + Math.random()