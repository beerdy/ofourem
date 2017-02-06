# encoding: UTF-8

require 'rubygems'
require 'rack'
require 'json'
require 'pp'
require 'erb'

require './lib/deep_struct'

require './options_project'
require './db_project'

require './TestDriver.rb'

use Rack::Reloader, 0
use Rack::Static, :urls => ['/public']

require './config.rb'

require './engine/_RenderPage.rb'
require './engine/_Environment.rb'
require './engine/_BaseProject.rb'


#===================#
# -- Mix методов -- #
#===================#
INCLUDING_PATH = ['engine','engine/model']
SHARED_PATH = 'engine/shared'

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
    next if not /^[A-Z][A-Za-z]{1,256}\.rb$/ =~ clss

    clss = clss[0..-4]
    require "./#{path}/#{clss}"
    shared.each do |md|
      eval "class #{clss};include #{md};end"
    end
  end
end


class Application
  include RenderPage

  def call(env)
# Переписываем стандартное исключение для всего кода (собственно только на вывод)
begin

  # RUN def call(env)
    no_route     = true
    request_path = env['REQUEST_PATH']
    start = MegaController.new env

    # > static page
    return start.index if request_path.match(%r{^/$})
    return start.admin if request_path.match(%r{^/admin$})
    return start.user  if request_path.match(%r{^/user$})
    # < end static page
    
    unless start.env.check
        puts "error: #{start.env.info}"
        return start.error( start.env.info ) 
    end

    return start.element_add  if request_path.match(%r{^/element_add$})

    return start.error( {:bool => false, :code => 8003, :info => "Страница ненайдена - #{request_path}"} ) if no_route
  # END end def call(env)

rescue => e
case e.backtrace[0]
when /Rendering/
  /undefined\smethod\s\`\+'\sfor\s(.{1,2048}):Hash$/.match(e.message)
  hash = eval $1
  key, value = hash.first
  case key
  when :json
    return render_page value
  when :file
    return render_page value
  when :index
    return render_page
  else
    return render_page
  end
when /ANother/
  # Another mixin File
else
  puts e.message
  puts e.inspect 
  puts e.backtrace
end
  end
end
end
run Application.new()