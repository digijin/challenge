pg = require 'pg'

url = process.env.DATABASE_URL or 'postgres://postgres:pass@localhost:5432/postgres'

console.log 'db initing'



pg.connect url, (err, client, done) ->
	console.log 'error', err
	# client.query "SELECT * FROM pg_catalog.pg_tables WHERE pg_catalog.pg_tables.schemaname = 'public'", console.log
	# client.query '\dt', console.log
	module.exports = client
	done()


