this.error = 
  element: new Object

  init: () ->
    @element_()
  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 

    #1. получим структуру из свойств объекта. Удобно для восприятия
    @element = JSON.parse JSON.stringify(window.O4.pp.element)

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.range_length = (obj,bool) ->
      console.log 'error text range_length:', bool
      if bool
        obj.className += " error1"
      else
        obj.className = " "

    @element.add.field.range_count = (obj,bool) ->
      console.log 'error field range_count:', bool
    @element.add.field.range_length = (obj,bool) ->
      console.log 'error field range_length:', bool
      if bool
        obj.className += " error1"
      else
        obj.className = " "