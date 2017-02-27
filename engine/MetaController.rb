# encoding: UTF-8

class MetaController
  def initialize env
    @env = env
  end

  def element_add meta
    puts "Result bool: #{meta.ok?} with ID #{meta.inserted_id}"
    #puts "Meta element_add: #{meta.methods.sort}"
  end
end