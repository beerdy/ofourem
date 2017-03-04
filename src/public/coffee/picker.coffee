this.picker = 
  element: new Object

  init: () ->
    @element_()

  element_: () ->
    @element =
      add: () ->
        env.element.add['t1'] = document.getElementById('t1').value

        for i in [1..env.element.add.c]
          field = 'f'+i
          element_obj = document.getElementById field
          env.element.add[field] = element_obj.value
          #env.element.add[field] = inspection.element.add document.getElementById(field), field

        console.log 'pick element add complete'