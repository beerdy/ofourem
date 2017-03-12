this.error = 
  element: new Object

  init: () ->
    @element_()
    #@element.add.text.min_length('obj')
  element_: () ->
    # Задача превратить в фкнуцию конечное свойство объекта 

    #1. получим структуру из свойств объекта
    @element = JSON.parse JSON.stringify(window.O4.pp.element)

    #2. превратим в фкнуцию конечное свойство объекта
    @element.add.text.min_length = (obj) ->
      obj.className += " error1"
      console.log obj
    @element.add.text.max_length = (obj) ->
      console.log obj
    @element.add.text.min_count = (obj) ->
      console.log obj
    @element.add.text.max_count = (obj) ->
      console.log obj

    @element.add.field.min_length = (obj) ->
      console.log obj
    @element.add.field.max_length = (obj) ->
      console.log obj
    @element.add.field.min_count = (obj) ->
      console.log obj
    @element.add.field.max_count = (obj) ->
      console.log obj



    #@element = window.O4.tt.error.inspection
    #console.log @element_tt