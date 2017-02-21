this.net = 
  element: new Object

  init: (argument) ->
    @element_()

  element_: () ->
    @element = 
      add: () ->
        env.client.params['t']='test text'
        env.client.params['f1']='test filed 1'
        env.client.params['f2']='test filed 2'
        stdAjax 'element_add', env.client.params

console.log 'ready'

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
      console.log 'server asked:','oooo'
      return
    beforeSend: ->
      # body