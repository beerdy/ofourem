# encoding: UTF-8

module Rendering
  def render(code={}, option=nil)
    raise code.to_json
  end

  # Alias rendering
  def r message
    #render :json => { :data => JSON.parse(message) }

    #Только для json
    #render :json => { :data => message }

    #Автовыбор
    render :content => { :data => message }
  end
end