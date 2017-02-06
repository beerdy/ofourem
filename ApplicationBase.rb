# encoding: UTF-8

require "./Application"

RENDERING_MSG_MAX_SIZE = 2048

INCLUDING_PATH = ['engine','engine/model']
SHARED_PATH = 'engine/shared'

EXCEPTIONS_CLSS = ['BaseProject.rb','Environment.rb','RenderPage.rb']

INCLUDING_PATH.each do |path|
  # Подключим расширяемые модули
  shared = `ls #{SHARED_PATH}/`.split("\n")
  shared.each_with_index do |md,index|
    if not /^[A-Z][A-Za-z]{1,256}\.rb$/ =~ shared[index]
      shared.delete(index)
      next
    end  
    shared[index] = shared[index][0..-4]
    require "./#{SHARED_PATH}/#{md}"
  end

  # Расширим модулями классы
  `ls #{path}`.split("\n").each do |clss|
    next if not /^[A-Z][A-Za-z]{1,256}\.rb$/ =~ clss if !EXCEPTIONS_CLSS.include? clss

    clss = clss[0..-4]
    require "./#{path}/#{clss}"
    shared.each do |md|
      rr = ("class #{clss};include #{md};end")
      p rr
      eval(rr)
    end
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
