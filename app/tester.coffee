fs = require 'fs'
_ = require 'lodash'
path = require 'path'
Sandbox = require 'sandbox'
coffee = require 'coffee-script'
q = require 'q'

pre = fs.readFileSync './app/tester/pre.coffee'
pre = coffee.compile pre.toString(), {bare:true}



files = fs.readdirSync path.resolve './app/challenge'
specs = {}
files.forEach (file) ->
	base = file.substr 0, file.indexOf '.'
	if file.indexOf('spec') >-1
		spec = fs.readFileSync path.resolve './app/challenge/'+file
		specs[base] = coffee.compile spec.toString(), {bare:true}

# console.log specs

module.exports = (code, challenge) ->

	def = q.defer()
	results = []
	box = new Sandbox();
	box.on 'message', (out) ->
		results.push out
		# console.log out
	script = code + ';' + pre + specs[challenge]
	# console.log script
	box.run script, (out) ->
		# console.log out
		# console.log results
		def.resolve results

	def.promise
