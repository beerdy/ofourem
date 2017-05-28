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
  params['action'] = action # Так та вот в люом случае извещен
  console.log 'Send To SRV:', params
  $.ajax
    type: 'POST'
    url: '/'+action
    async: true
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(params)
    success: (s) ->
      env.element.read = JSON.parse s
      console.log 'SRV Asked:','Foo:', env.element.read
      return
    beforeSend: ->
      console.log 'End'
      # body