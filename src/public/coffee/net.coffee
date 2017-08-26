this.net = 
  element: new Object
  elements: new Object

  init: (argument) ->
    @element_()
    @elements_()

  element_: () -> 
    @element = 
      add: () -> stdAjax()
      read: () -> stdAjax()
  elements_: () ->
    @elements = 
      read: () -> stdAjax()

# ------------------------------ #
# -- AJAX to Server by jQuery -- #
# ------------------------------ #
stdAjax = () ->
  env.client.params['j'] = 1 # Известим сервер об том что это AJAX для того, чтобы ответ был тоже в формате AJAX
  env.client.params['action'] = env.client.action # Так та вот в люом случае извещен

  $.ajax
    type: 'POST'
    url: '/'+env.client.action
    async: false
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(env.client.params)
    success: (s) ->
      if s
        try
          env.response = JSON.parse s
          console.log '200 Asked:', env.response

          writecity = document.createTextNode(s)
          document.getElementById("textAreaID").appendChild(writecity)
          
          state.response = true
        catch e
          state.response = false # by default
          error.response e
      return
    beforeSend: ->
      console.log 'REQUEST:', env.client.params