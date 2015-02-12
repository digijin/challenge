db = require '../db'
# module.exports = (params) ->
escape = require 'pg-escape'
q = require 'q'

class Model
	constructor: (params) ->
		@tableName = params.tableName

	insert: (data) ->
		defer = q.defer()
		fields = []
		values = []
		for key of data
			fields.push escape.ident key
			values.push escape.literal data[key]
		sql = 'insert into '+@tableName+' ('+fields.join(',')+') values ('+values.join(',')+') returning id'
		db.query sql
				.then (out) ->
					defer.resolve out.rows[0].id
		q.promise


module.exports = Model