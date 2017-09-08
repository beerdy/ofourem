this.net = 
  element: new Object
  elements: new Object
  vk: new Object

  init: (argument) ->
    @element_()
    @elements_()
    @vk_()

  element_: () -> 
    @element = 
      add: () -> stdAjax(env.element.add)
      read: () -> stdAjax()
  elements_: () ->
    @elements = 
      read: () -> stdAjax()
  vk_: () ->
    @vk =
      auth: () -> stdAjax()


# ------------------------------ #
# -- AJAX to Server by jQuery -- #
# ------------------------------ #
stdAjax = (params) ->
  params['j'] = 1 # Известим сервер об том что это AJAX для того, чтобы ответ был тоже в формате AJAX
  params['action'] = env.client.action # Так та вот в люом случае извещен

  $.ajax
    type: 'POST'
    url: '/'+env.client.action
    async: false
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(params)
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
      console.log 'REQUEST:', params