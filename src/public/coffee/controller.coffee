this.controller =
  element: new Object

  init: (argument) -> 
    @element_()

  element_: () ->
    @element = 
      add: () ->
        net.element.add() if picker.element.add()
      # Не забыть откешировать ID
      field:
        append: () ->
          document.getElementById('elementFieldRemove').style.display = 'block' if env.element.add.field.c==window.O4.pp.element.add.field.range_count[0]

          env.element.add.field.c += 1

          obj = document.getElementById 'style--'+window.O4.pp.element.add.field.id_prefix+env.element.add.field.c
          obj.style.display = 'list-item'

          console.log env.element.add.field.c
          document.getElementById('elementFieldAppend').style.display = 'none' if env.element.add.field.c >= window.O4.pp.element.add.field.range_count[1]

        remove: () ->
          document.getElementById('elementFieldAppend').style.display = 'block' if env.element.add.field.c==window.O4.pp.element.add.field.range_count[1]

          field = window.O4.pp.element.add.field.id_prefix+env.element.add.field.c
          
          obj = document.getElementById 'style--'+field
          obj.style.display = 'none'
          
          obj = document.getElementById field
          obj.value = ''
          
          env.element.add.field.c -= 1

          document.getElementById('elementFieldRemove').style.display = 'none' if env.element.add.field.c <= window.O4.pp.element.add.field.range_count[0]
          console.log env.element.add.field.c