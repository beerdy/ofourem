# encoding: UTF-8

#require "./Rendering.rb"

INCLUDING_PATH = 'include'
SHARED_PATH = 'shared'

module ExtendClasses
  def extend_classes
    # Подключим расширяемые модули
    shared = `ls #{INCLUDING_PATH}/#{SHARED_PATH}`.split("\n")
    shared.each_with_index do |md,index|
      puts "shared:#{index}=#{shared[index]}"
      if not /^[A-Z]/ =~ shared[index]
        puts "nonon"
        shared.delete(index)
        next
      end  
      shared[index] = shared[index][0..-4]
      puts "shared[index]:#{shared[index]}"

      require "./#{INCLUDING_PATH}/#{SHARED_PATH}/#{md}"
    end

    # Расширим модулями классы
    `ls #{INCLUDING_PATH}`.split("\n").each do |clss|
      next if clss == SHARED_PATH and not /^[A-Z]/ =~ clss
      
      clss = clss[0..-4]
      require "./#{INCLUDING_PATH}/#{clss}"
      shared.each do |md|
        rr = ("class #{clss};include #{md};end")
        p rr
        eval(rr)
      end
    end
  end
end

#capitalize

=begin
def extcl
  next_class_name = 'example_class'
  require "./include/#{next_class_name}"
end

extcl

eval("class ExampleClass; include Rendering;end")

=end