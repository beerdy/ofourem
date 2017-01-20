# encoding: UTF-8

# ==== 

#config.ru

#puts eval('@var', Klass.new.get_binding)  #=> 42


require "./Rendering"

def extcl
  next_class_name = 'example_class'
  require "./include/#{next_class_name}"
end

extcl

eval("class ExampleClass; include Rendering;end")

