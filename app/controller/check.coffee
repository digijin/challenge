fs = require 'fs'
_ = require 'lodash'
path = require 'path'
Sandbox = require 'sandbox'

# childProcess = require 'child_process'

# ls = childProcess.exec('ls -l', (error, stdout, stderr) ->
# 	if error
# 		console.log error.stack
# 		console.log 'Error code: ' + error.code
# 		console.log 'Signal received: ' + error.signal
# 	console.log 'Child Process STDOUT: ' + stdout
# 	console.log 'Child Process STDERR: ' + stderr
# 	return
# )
# ls.on 'exit', (code) ->
# 	console.log 'Child process exited with exit code ' + code
# 	return

# proc = childProcess.exec('node')
# proc.send '123', (data) ->
# 	console.log data

test = require '../tester'

code = 'function Add(a, b) {\r\nreturn a+b;\r\n}'
# specs = ' Add(1,2)==3'
# specs = 'expect(Add(1,2)).toBe(3)'
test(code, 'basic')

# box.run 'a', console.log 


view = _.template fs.readFileSync path.resolve './app/view/result.html'

module.exports = (req, res, next) ->
	# res.send 'challenge accepted! but not fulfilled. :('
	post = req.body
	console.log post
	# proc = childprocess

	res.send view {
		post:post
		message: 'challenge accepted! but not fulfilled. :('
	}