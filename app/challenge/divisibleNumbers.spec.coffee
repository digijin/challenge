it 'should return counts', ->
	expect(Div3 [1,2,3,4,5,6]).toBe 2
	expect(Div3 [3,6,9,369]).toBe 4
	# expect(Add(4,5)).toBe 9