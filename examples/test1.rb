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


[
  'lada-vesta' => 'http://prime.lada.ru/ds/cars/vesta/sedan/prices.html',
  'lada-xray-krossover' => 'http://prime.lada.ru/ds/cars/xray/hatchback/prices.html',
  'lada-largus-5-mest' => 'http://prime.lada.ru/ds/cars/largus/universal/prices.html',
  'lada-largus-7-mest' => 'http://prime.lada.ru/ds/cars/largus/universal/prices.html',
  'lada-largus-cross-7-mest' => 'http://prime.lada.ru/ds/cars/largus/cross/prices.html',
  'lada-largus-cross-5-mest' => 'http://prime.lada.ru/ds/cars/largus/cross/prices.html',
  'lada-granta-sedan' => 'http://prime.lada.ru/ds/cars/granta/sedan/prices.html',
  'lada-granta-liftbek' => 'http://prime.lada.ru/ds/cars/granta/liftback/prices.html',
  'lada-granta-sport' => 'http://prime.lada.ru/ds/cars/granta/sport/prices.html',
  'lada-priora-sedan' => 'http://prime.lada.ru/ds/cars/priora/sedan/prices.html',
  'lada-kalina-hatchback' => 'http://prime.lada.ru/ds/cars/kalina/hatchback/prices.html',
  'lada-kalina-uni' => 'http://prime.lada.ru/ds/cars/kalina/universal/prices.html',
  'lada-kalina-cross' => 'http://prime.lada.ru/ds/cars/kalina/cross/prices.html',
  'lada-kalina-sport' => 'http://prime.lada.ru/ds/cars/kalina/sport/prices.html',
  'lada-4x4-3-dveri' => 'http://prime.lada.ru/ds/cars/4x4/3dv/prices.html',
  'lada-4x4-urban-3dveri' => 'http://prime.lada.ru/ds/cars/4x4/urban/prices.html',
  'lada-4x4-5-dverey' => 'http://prime.lada.ru/ds/cars/4x4/5dv/prices.html',
  'lada-4x4-urban-5-dv' => 'http://prime.lada.ru/ds/cars/4x4/5dv/prices.html'
]