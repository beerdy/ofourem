# encoding: UTF-8

class MetaController
  def initialize env
    @env = env
  end

  def element_add meta
    puts "No meta for added element: #{meta}"
    return meta
  end
end