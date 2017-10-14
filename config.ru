# encoding: UTF-8

require './lib/deep_struct'
require './lib/ip_project'
require './lib/app_utils'

require './template'
require './property'
require './options_project'
require './db_project'

require './TestDriver'

require './config'
require './engine/_RenderPage'
require './engine/_ControllerInitialize'
require './engine/modules/Auth.rb'
require './engine/poll/WSPoll'
require './router'

require './engine/config/vkontakte_api.rb'


#===================#
# -- Mix методов -- #
#===================#
# Что замешиваем
SHARED_PATH = 'engine/shared'
# Куда замешиваем
INCLUDING_PATH = ['engine','engine/business']

INCLUDING_PATH.each do |path|
  # Подключим расширяемые модули
  shared = `ls #{SHARED_PATH}/`.split("\n")
  shared.each_with_index do |md,index|
    unless /^[A-Z][A-Za-z]{1,256}\.rb$/ =~ shared[index]
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



Application = lambda do |env|

  # По сути берется только среда - остальное независимо
  return WSPoll.call env if Faye::WebSocket.websocket? env

# Переписываем стандартное исключение для всего кода (собственно только на вывод)
begin

  no_route = true

  env['rack_input'] ||= env['rack.input'].read # После считывания env["rack.input"].read кудато проподает (можно потом глянуть - зачем?)
  env['request'] ||= Rack::Request.new env

  mcontroller = MegaController.new env

  return Router.to mcontroller, env['REQUEST_PATH']

rescue => e
  #Rendering::Exception.console e

  message = JSON.parse(e.message)
  case message['rendertempate']
  when "Rendering"
    return RenderPage.render_page( message, mcontroller.env, env['request'] ) if mcontroller.respond_to? :env
    return RenderPage.render_page( message, nil, env['request'] )
  when "ANother"
    # Another mixin File
  else
    
  end

end ### // "rescue" exception
end # // "Application" lambda

Faye::WebSocket.load_adapter 'thin'

app = Rack::Builder.app do
  use Rack::Reloader, 0
  use Rack::Static, :urls => ['/public']
  run Application
end

run app 


