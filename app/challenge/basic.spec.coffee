module.exports = ->
	describe "Basic", ->
		it "should add two numbers together", ->
			expect(Add(1, 2)).toBe(3)