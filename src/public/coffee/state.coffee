this.state = 
  element: new Object

  init: () ->
    @element_()

  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 
    #1. получим структуру из свойств объекта. Удобно для восприятия
    @element = JSON.parse JSON.stringify(window.O4.pp.element) # Новый объект

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.min_length = false
    @element.add.text.max_length = false
    @element.add.text.min_count = false
    @element.add.text.max_count = false
    @element.add.field.min_length = false
    @element.add.field.max_length = false
    @element.add.field.min_count = false
    @element.add.field.max_count = false

