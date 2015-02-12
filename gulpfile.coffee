gulp = require 'gulp'
require('matchdep').filter('gulp-*').forEach (ob) -> gulp[ob.substr 5] = require ob

gulp.task 'default', ['nodemon']

gulp.task 'nodemon', ->
	gulp.nodemon {
		script: 'app/server.coffee'
		ext: 'coffee html'
	}