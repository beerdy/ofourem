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
    #@element.add = {
    #  'c': window.O4.property.element.add.field.min_count
    #}