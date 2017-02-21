# encoding: UTF-8

module Rendering
  def render(code={}, option=nil)
    raise code.to_json
  end

  # Alias JSON rendering
  def r message
    render :json => { :data => JSON.parse(message) }
  end
end