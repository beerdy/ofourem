# encoding: UTF-8

class ElementsRead
  def initialize env
    @env = env
  end

  def all
    r $element_o4.find().limit(O4.pp.element.read.limit).to_a
  end
end