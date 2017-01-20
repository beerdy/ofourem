# encoding: UTF-8
require 'ostruct'


a = {
  :a => 'b'
}

o  = OpenStruct.new(a)

puts "o->a: #{o.a}" if o.a
a = o.c ? 'yes' : 'no'
puts "status: #{a}"