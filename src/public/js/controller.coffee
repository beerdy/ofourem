this.controller =
  element: new Object
  
  init: (argument) -> 
    @element_()

  element_: () ->
    @element = 
      add: () ->
        picker.element.add()
        net.element.add()