# encoding: UTF-8

module Rendering
  def render(code={}, option=nil)
    raise code.merge({ :rendertempate => 'Rendering' }).to_json
  end

  # Alias render
  def r message
    #render :json => { :data => JSON.parse(message) }

    #Только для json
    #render :json => { :data => message }

    #Автовыбор
    render :content => { :data => message }
  end
  

  module Exception
    class << self
      def console(e)
        puts '//-----------------'
        puts "ER: PROJECT MESSAGE - #{e.message}"
        puts "ER: PROJECT INSPECT - #{e.inspect}"
        puts "ER: PROJECT BACKTRACE0 - #{e.backtrace[0]}"
        puts '-----------------//'
      end
    end
  end
end