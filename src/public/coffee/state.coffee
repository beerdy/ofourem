this.state = 
  element: new Object

  init: () ->
    @element_()

  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 
    #1. получим структуру из свойств объекта. Удобно для восприятия
    @element = JSON.parse JSON.stringify(window.O4.pp.element) # Новый объект

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.range_length = false
    @element.add.text.range_length = new Object

    @element.add.field.range_count = false
    @element.add.field.range_length = new Object