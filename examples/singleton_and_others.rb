
module Personal
  def tetris
    'tetris'
  end
end


class Parent
  include Personal
  def self.next_method
    'self#Parent#some_method'
  end
  def some_method
    'obj#Parent#some_method'
  end
end

class Child < Parent
  class << self
    def inner
      'innner meth class'
    end

    attr_accessor :macros_ifoli
  end
end

class Second
  def esw
    'yyyytttt'
    def ity
      'opppps'
    end
  end
end

obj1 = Child.new
obj2 = Second.new

class << obj2
  def pp
    'pppppp'
  end
end

puts obj2.pp
puts obj2.esw
puts obj2.ity
puts Child.inner
Child.macros_ifoli = 'nisumi'
puts Child.macros_ifoli

puts '================='
str = "abc"
str.instance_eval do
  p self              # => "abc"
  def double_length
    length * 2
  end
end

class << str
  p self              # => "abc"
  def double_length2
    length * 7
  end
end


str.singleton_methods # => [:double_length]
puts str.double_length     # => 6
puts str.double_length2






