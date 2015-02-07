# module.exports = [
# 	{
# 		desc: 'it should add two numbers'
# 		test: [
# 			'Add(1,2) === 3'
# 			'Add(4,5) === 9'
# 		]
# 	}
# ]

it 'should do basic additions', ->
	expect(Add(1,2)).toBe 3
	expect(Add(4,5)).toBe 9