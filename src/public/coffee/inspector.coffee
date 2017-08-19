this.inspector = 
  element: new Object
  elements: new Object

  init: () ->
    @element_()
    @elements_()
    #@element.add.text.min_length('obj')

  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 

    #1. получим структуру из свойств объекта. Удобно для восприятия
    @element = JSON.parse JSON.stringify(window.O4.pp.element)

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.range_length = (obj) ->
      return false if obj.value.length < window.O4.pp.element.add.text.range_length[0] or obj.value.length > window.O4.pp.element.add.text.range_length[1]
      return true
    
    @element.add.field.range_count = (obj) ->
      return false if env.element.add.field.c < window.O4.pp.element.add.field.range_count[0] or env.element.add.field.c > window.O4.pp.element.add.field.range_count[1]
      return true

    @element.add.field.range_length = (obj) ->
      return false if obj.value.length < window.O4.pp.element.add.field.range_length[0] or obj.value.length > window.O4.pp.element.add.field.range_length[1]
      return true

    @element.read = () ->
      # Проверка только на один элемент - если он есть то все ок
      return false if env.element.read[0]==undefined or env.element.read[0]==null
      return true

  elements_: () ->
    @elements.read = () ->
      return false if env.elements.read[0]==undefined or env.elements.read[0]==null
      return true