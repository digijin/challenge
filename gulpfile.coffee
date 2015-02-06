gulp = require 'gulp'
nodemon = require 'gulp-nodemon'


gulp.task 'default', ['nodemon']

gulp.task 'nodemon', ->
	nodemon {
		script: 'app/server.coffee'
		ext: 'coffee html'
	}