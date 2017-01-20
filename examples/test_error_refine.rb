
# using': Module#using is not permitted in methods (RuntimeError)

module A
  class ExampleClass
    def some_method

    end
  end

  module RenderModule
    refine ExampleClass do
      def render
        puts 'rendered'
      end    
    end
  end

  def A.included(module_name)
    using RenderModule
    puts "#{self} included in #{module_name}"
  end
end

module BaseModule
  include A

  
  class Application
    def run    
      obj = ExampleClass.new
      obj.render
    end
  end
end

BaseModule::Application.new().run

