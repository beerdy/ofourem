# encoding: UTF-8

module BaseModule
  class ExampleClass
    def example_method
      some_hash = { :text => 'this text' }
      render :json => some_hash #{'some_hash'=>12, 'elso_hash' => {'one'=>'some text','two'=>true}}
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
      obj_ex.example_method

      puts 'end code'
    end
  end
  
  refine ExampleClass do
    def render(code, option=nil)
      type, line = code.first
      puts type
      eval(type.to_s)
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
end




