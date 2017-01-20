# encoding: UTF-8

require "./Application"

require "./Rendering.rb"

def extcl
  next_class_name = 'example_class'
  require "./include/#{next_class_name}"
end

extcl

eval("class ExampleClass; include Rendering;end")

# Переписываем стандартное исключение для всего кода (собственно только на вывод)
begin
  Application.run
rescue => e
  case e.backtrace[0]
  when /Rendering/
    /undefined\smethod\s\`\+'\sfor\s(.{1,2048}):Hash$/.match(e.message)
    puts "RENDERED: #{$1}"
  when /ANother/
    # Another mixin File
  else
    puts e.message
    puts e.inspect 
    puts e.backtrace
  end
end
