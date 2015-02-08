pg = require 'pg'
pg.connect 'localhost', (err, client, done) ->
	console.log err
	console.log "im in"