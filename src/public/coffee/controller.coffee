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

          document.getElementById('elementFieldAppend').style.display = 'none' if env.element.add.field.c >= window.O4.pp.element.add.field.range_count[1]

        remove: () ->
          document.getElementById('elementFieldAppend').style.display = 'block' if env.element.add.field.c==window.O4.pp.element.add.field.range_count[1]

          field = window.O4.pp.element.add.field.id_prefix+env.element.add.field.c
          
          obj = document.getElementById 'style--'+field
          obj.style.display = 'none'
          
          obj = document.getElementById field
          obj.value = ''

          if state.element.add.field.range_length[field]!=undefined
            # Удалим обработчик ошибок и класс самой ошибки - error1
            obj.removeEventListener 'keyup', window[field], false
            state.element.add.field.range_length[field] = undefined
            error.element.add.field.range_length obj, false

          env.element.add.field.c -= 1

          document.getElementById('elementFieldRemove').style.display = 'none' if env.element.add.field.c <= window.O4.pp.element.add.field.range_count[0]

