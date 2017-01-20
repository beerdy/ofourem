# encoding: UTF-8

module BaseModule
  
  # так не работает  -ниже объявленные классы не видят метод dsd
  def dsd
  end

  class ExampleClass
    def example_method
      # dsd не сработает см. выше      
      some_hash = { :text => "#n}\\nthis text" }
      render :json => some_hash #{'some_hash'=>12, 'elso_hash' => {'one'=>'some text\','two'=>true}}
      return 'no rendering'
    end

  end


  class Application

    # Included modules for App
    
    def initialize
    end

    def start
      puts 'start code'
      
      obj_ex = ExampleClass.new()
      # init render for


      obj_ex.example_method

      puts 'end code no rendering'
    end
  end

  def application
    obj_app = Application.new()
    obj_app.start
  end

  extend self
end


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
      refine ExampleClass do
        def render(code, option=nil)
          type, line = code.first

          puts type
          puts line
          eval("#{code+1}")
        end
      end
=end