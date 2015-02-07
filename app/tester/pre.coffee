
describe = (desc, func) ->
	# do nothing...yet
	func()

itdesc = ""

it = (desc, func) ->
	itdesc = desc
	func()

expect = (val) ->
	{
		toBe: (expected) ->
			postMessage {
				pass: val == expected
				value: val
				expected: expected
				desc: itdesc
			}
	}