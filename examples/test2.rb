# encoding: UTF-8

module BaseModule
  
  # так не работает  -ниже объявленные классы не видят метод dsd
  def dsd
  end



  class Application

    # Included modules for App
    
    def initialize
    end

    def start
      puts 'start code'
      
      obj_ex = SomeClass.new()
      # init render for


      obj_ex.some_method

      puts 'end code no rendering'
    end
  end

  def application
    obj_app = Application.new()
    obj_app.start
  end

  extend self
end

# Переписываем стандартное исключение для всего кода (собственно только на вывод)
begin
  BaseModule.application
rescue => e
  puts e.message
  puts e.inspect 
  puts e.backtrace

  /undefined\smethod\s\`\+'\sfor\s(.{1,2048}):Hash$/.match(e.message)
  puts $1
end
puts 'end programm'


=begin
      refine SomeClass do
        def render(code, option=nil)
          type, line = code.first

          puts type
          puts line
          eval("#{code+1}")
        end
      end
=end