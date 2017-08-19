this.error = 
  response: new Object
  element: new Object
  elements: new Object

  init: () ->
    @response_()
    @element_()
    @elements_()

  # Можно конечно и сразу в хидере но это будет авто инит
  response_: () ->
    @response = (e) ->
      # На данный момент тут ошибки парсинга
      console.log e

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
        obj.className = obj.className.replace " error1", ""

    @element.add.field.range_count = (obj,bool) ->
      console.log 'error field range_count:', bool
    @element.add.field.range_length = (obj,bool) ->
      console.log 'error field range_length:', bool
      if bool
        obj.className += " error1"
      else
        obj.className = obj.className.replace " error1", ""

    @element.read = () ->
      message = 'error read one element'
      console.log message
      error = document.createTextNode message
      elementsListContainer.appendChild error

  elements_: () ->
    @elements = 
      read: () ->
        message = 'error read many elements'
        console.log message
        error = document.createTextNode message
        elementsListContainer.appendChild error


