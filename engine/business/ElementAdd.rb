# encoding: UTF-8

class ElementAdd
  def initialize env
    @env = env
  end

  def insert element
    puts "INSERT: element added - #{element}"
    $element_o4.insert_one element
  end
end