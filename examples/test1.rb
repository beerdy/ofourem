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

module Bb
  def env=(env)
    @env = env
  end
  def env
    @env
  end
  def initialize(env={})
    
    @env = env
  end
end

class Hh
  def init(env)
    @env = env
    return self
  end
  def op
    'op'
  end
end

class Hh
  include Bb
end

main = Hh.new().init({:c=>'cccc'})
p main.op
p main.env


#puts main.op
#puts main.env
#main.env = {'b'=>2}
#puts main.env
