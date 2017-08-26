this.env =
  response: new Object
  client: new Object
  element: new Object
  elements: new Object

  init: (argument) ->
    @client_()
    @element_()
    @elements_()
  
  client_: () ->
    @client.action = undefined
    @client.params = new Object

  element_: () ->
    @element.add =
      'field':
        'c': window.O4.pp.element.add.field.range_count[0]
      'text': new Object
    @element.read = new Object

  elements_: () ->
    @elements.read = new Object