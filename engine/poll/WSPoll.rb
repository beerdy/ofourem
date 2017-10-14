# encoding: UTF-8


NOWS = 'No WS request.'


WSPoll = lambda do |env|

  ws = Faye::WebSocket.new(env, ['irc', 'xmpp'],  {:extensions => O4ptions.poll.extensions, :ping => O4ptions.poll.ping } )
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