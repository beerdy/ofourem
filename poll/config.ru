# encoding: UTF-8

require 'eventmachine'
require 'rack'
require 'thin'
require 'faye/websocket'
require 'permessage_deflate'


require './appmy'




app = Rack::Builder.app do
  use Rack::Reloader, 0
  use Rack::Static, :urls => ['/public']
  run App
end

run app 