# encoding: UTF-8

module Rendering
  def render(code={}, option=nil)
    type, line = code.first
    #puts type
    #puts line
    eval("#{code+1}")
  end
end