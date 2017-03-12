this.inspection = 
  element: new Object

  init: () ->
    @element_()

  element_: () ->
    @element =
      add: () ->
        obj = document.getElementById 't1'
        value = obj.value
        length = value.length
        console.log 'min_length', length, window.O4.pp.element.add.text.min_length

        if length < window.O4.pp.element.add.text.min_length
          error.element.add.text.min_length obj
          return false

        if length > window.O4.pp.element.add.text.max_length
          error.element.add.text.max_length obj
          return false

        env.element.add['t1'] = value
        
        for i in [1..env.element.add.c]
          field = 'f'+i
          obj = document.getElementById field
          value = obj.value
          length = value.length

          if length < window.O4.pp.element.add.field.min_length
            alert 'STOP'
            element.add.field.min_length obj
            return false
          if length > window.O4.pp.element.add.field.max_length
            element.add.field.max_length obj
            return false

          env.element.add[field] = obj.value

        console.log 'Inspection>>> element add: -=TRUE=-'
        return true