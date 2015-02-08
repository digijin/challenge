pg = require 'pg'
q = require 'q'
_ = require 'lodash'

url = process.env.DATABASE_URL or 'postgres://postgres:pass@localhost:5432/postgres'

console.log 'db initing'


condefer = q.defer()
connect = condefer.promise
pg.connect url, (err, client, done) ->
	# console.log 'error', err
	# client.query "SELECT * FROM pg_catalog.pg_tables WHERE pg_catalog.pg_tables.schemaname = 'public'", console.log
	# client.query '\dt', console.log
	# module.exports = client
	condefer.resolve client
	done()

# connect.then (conn)->
# 	console.log 'resolved'
# # 	console.log "then", conn
# 	conn.query "SELECT * FROM users". console.log 




module.exports = {
	query: (query) ->
		defer = q.defer()
		connect.then (conn)->
			# console.log query
			conn.query query, (err, result) ->
				defer.resolve result
				# console.log result
		defer.promise

	tables: ->
		@query "SELECT * FROM pg_catalog.pg_tables WHERE pg_catalog.pg_tables.schemaname = 'public'"
}