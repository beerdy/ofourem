# encoding: UTF-8


NOWS = 'No WS request.'


WSPoll = lambda do |env|

  options = {:extensions => [PermessageDeflate], :ping => 5}
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

end