# encoding: UTF-8

# Обход запрета выполнения using в методе https://www.new-bamboo.co.uk/blog/2014/02/05/refinements-under-the-knife/

module A
  puts 'op'
end

module BaseModule
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
  using RenderModule

  class Application
    def run    
      obj = ExampleClass.new
      obj.render
    end
  end
end

BaseModule::Application.new().run