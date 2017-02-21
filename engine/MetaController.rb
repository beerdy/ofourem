# encoding: UTF-8

class MetaController
  def initialize env
    @env = env
  end

  def element_add meta
    puts "Meta element_add: #{meta}"
  end
end