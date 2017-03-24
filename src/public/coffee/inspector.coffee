this.inspector = 
  element: new Object

  init: () ->
    @element_()
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


    #@element = window.O4.tt.error.inspection
    #console.log @element_tt