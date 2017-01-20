# encoding: UTF-8

# ==== 

#config.ru

#puts eval('@var', Klass.new.get_binding)  #=> 42

next_class_name = 'example_class'

require "./Rendering"

require "./include/#{next_class_name}"

eval("class ExampleClass; include Rendering;end")

o = ExampleClass.new()

data = o.some_method

o.render data