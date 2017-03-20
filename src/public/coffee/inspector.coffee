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
      console.log obj
    @element.add.field.range_length = (obj) ->
      console.log obj


    #@element = window.O4.tt.error.inspection
    #console.log @element_tt