this.net = 
  element: new Object

  init: (argument) ->
    @element_()

  element_: () ->
    @element = 
      add: () ->
        stdAjax 'element_add', env.element.add
      read: () ->
        # Пока все
        stdAjax 'element_read', env.element.read

# ------------------------------ #
# -- AJAX to Server by jQuery -- #
# ------------------------------ #
stdAjax = (action, params) ->
  params['j'] = 1 # Известим сервер об том что это AJAX для того, чтобы ответ был тоже в формате AJAX

  console.log 'send to server:', params
  $.ajax
    type: 'POST'
    url: '/'+action
    async: true
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(params)
    success: (s) ->
      console.log 'server asked:','foooo:', JSON.parse(s)
      return
    beforeSend: ->
      console.log 'end'
      # body