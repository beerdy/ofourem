this.env = 
  client: new Object
  element: new Object

  init: (argument) ->
    @client_()
    @element_()
  
  client_: () ->
    @client.action = undefined
    @client.params = new Object

  element_: () ->
    @element.add = {
      'c': window.O4.pp.element.add.field.range_count[0]
    }