this.net = 
  element: new Object
  elements: new Object

  init: (argument) ->
    @element_()
    @elements_()

  element_: () ->
    @element = 
      add: () ->
        stdAjax 'element_add', env.element.add
      read: () ->
        stdAjax 'element_read', env.element.read
  
  elements_: () ->
    @elements =
      read: () ->
        stdAjax 'elements_read', env.elements.read

# ------------------------------ #
# -- AJAX to Server by jQuery -- #
# ------------------------------ #
stdAjax = (action, params, response) ->
  params['j'] = 1 # Известим сервер об том что это AJAX для того, чтобы ответ был тоже в формате AJAX
  params['action'] = action # Так та вот в люом случае извещен

  $.ajax
    type: 'POST'
    url: '/'+action
    async: true
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(params)
    success: (s) ->
      if s
        try
          env2.response = JSON.parse s
          console.log '200 Asked:', env2.response
        catch e
          error.response e  
      return
    beforeSend: ->
      console.log 'REQUEST:', params