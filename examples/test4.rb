#level3
class Bs
	def start
	end
end
#level2
class Ap
	attr_reader :env
	def initialize(env)
		@env = env
	end
	def index
	end
end
#level1
class Op
	def ppp
		env = {:a=>'a',:b=>'b'}
		main = Ap.new(env)
		main.index
	end
end

Op.new().ppp

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


