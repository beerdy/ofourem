# encoding: UTF-8



NOWS = 'No WS request.'

App = lambda do |env|

  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env, ['irc', 'xmpp'], O4ptions.poll)
    p [:open, ws.url, ws.version, ws.protocol]

    ws.onmessage = lambda do |event|
      ws.send event.data
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