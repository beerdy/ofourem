this.net = 
  element: new Object

  init: (argument) ->
    @element_()

  element_: () ->
    @element = 
      add: () ->
        stdAjax env.client.action, env.client.params



# ------------------------------ #
# -- AJAX to Server by jQuery -- #
# ------------------------------ #
stdAjax = (action, params) ->
  console.log 'send to server:', params
  $.ajax
    type: 'POST'
    url: '/'+action
    async: false
    contentType: 'application/json; charset=UTF-8'
    data: JSON.stringify(params)
    success: (s) ->
      console.log 'server asked:', JSON.parse s
    beforeSend: ->
      # body