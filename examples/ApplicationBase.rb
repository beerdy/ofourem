# encoding: UTF-8

require "./Application"

RENDERING_MSG_MAX_SIZE = 2048
INCLUDING_PATH = 'include'
SHARED_PATH = 'shared'

# Подключим расширяемые модули
shared = `ls #{INCLUDING_PATH}/#{SHARED_PATH}`.split("\n")
shared.each_with_index do |md,index|
  if not /^[A-Z]/ =~ shared[index]
    shared.delete(index)
    next
  end  
  shared[index] = shared[index][0..-4]
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

# Переписываем стандартное исключение для всего кода (собственно только на вывод)
begin
  Application.run
rescue => e
  case e.backtrace[0]
  when /Rendering/
    /undefined\smethod\s\`\+'\sfor\s(.{1,RENDERING_MSG_MAX_SIZE}):Hash$/.match(e.message)
    puts "RENDERED: #{$1}"
  when /ANother/
    # Another mixin File
  else
    puts e.message
    puts e.inspect 
    puts e.backtrace
  end
end
