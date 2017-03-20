this.controller =
  element: new Object
  
  init: (argument) -> 
    @element_()

  element_: () ->
    @element = 
      add: () ->
        net.element.add() if picker.element.add()
      field:
        append: () ->
          env.element.add.field.c += 1
          obj = document.getElementById 'style--'+window.O4.pp.element.add.field.id_prefix+env.element.add.field.c
          obj.style.display = 'list-item'