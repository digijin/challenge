module.exports = (req, res, next) ->
	res.send 'challenge accepted! but not fulfilled. :('
	console.log req.body