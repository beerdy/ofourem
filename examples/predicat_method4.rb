class Tst
	attr_accessor :json
	def initialize
		@json = {}
	end
	def json?
		!@json.keys[0].nil?
	end
end
t = Tst.new()
p t.json?
t.json = {'a'=>1}
p t.json?


