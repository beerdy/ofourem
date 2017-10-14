# encoding: UTF-8


require './modules/AppUtils.rb'

static  = Rack::File.new(File.dirname(__FILE__))
options = {:extensions => [PermessageDeflate], :ping => 5}

NOWS = 'No WS request.'

App = lambda do |env|

  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env, ['irc', 'xmpp'], options)
    p [:open, ws.url, ws.version, ws.protocol]

    ws.onmessage = lambda do |event|
      ws.send event.data+"b"
    end

    ws.onclose = lambda do |event|
      p [:close, event.code, event.reason]
      ws = nil
    end

    ws.rack_response
  else
    AppUtils::Logs.console NOWS
    [200, {'Content-Type' => 'text/plain'}, [NOWS]]
  end

end