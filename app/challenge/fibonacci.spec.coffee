it 'should return correct value', ->
	expect(isFibonacci 3).toBe true
	expect(isFibonacci 4).toBe false
	expect(isFibonacci 5).toBe true