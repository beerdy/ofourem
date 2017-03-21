this.controller =
  element: new Object
  
  init: (argument) -> 
    @element_()

  element_: () ->
    @element = 
      add: () ->
        net.element.add() if listen.element.add()