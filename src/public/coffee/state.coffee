this.state = 
  response: new Object
  element: new Object
  elements: new Object
  init: () ->
    @response_()
    @element_()
    @elements_()
  response_: () ->
    @response = false
  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 
    #1. получим структуру из свойств объекта. Удобно для восприятия
    @element = JSON.parse JSON.stringify(window.O4.pp.element) # Новый объект

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.range_length = false
    @element.add.text.range_length = new Object

    @element.add.field.range_count = false
    @element.add.field.range_length = new Object

    @element.read = false

  elements_: () ->
    @elements.read = false