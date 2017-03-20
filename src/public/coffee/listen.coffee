this.listen = 

  element: new Object
 
  init: () ->
    @element_()

  element_: () ->
    @element = 
      state: state.element.add
      error: error.element.add # Ссылкой
      inspector: inspector.element.add
      pp: window.O4.pp.element.add # Так же ссылкой

      add: () ->
        console.log '@state:', @state

        obj = document.getElementById 't1'
        value = obj.value
        length = value.length

        unless @state.text.min_length and @inspector.text.min_length length, @pp.text.min_length
          obj.addEventListener 'keyup', (() ->
            #some codde
            console.log 'some actions'
            return
          ), false

          @error.text.min_length obj, true
          return false

        ####
        if length > @pp.text.max_length
          @error.text.max_length obj, true
          return false

        env.element.add['t1'] = value
        
        for i in [1..env.element.add.c]
          field = 'f'+i
          obj = document.getElementById field
          
          value = obj.value
          length = value.length

          if length < @pp.field.min_length
            @error.field.min_length obj, true
            return false
          if length > @pp.field.max_length
            @error.field.max_length obj, true
            return false

          env.element.add[field] = obj.value

        console.log 'Inspection>>> element add: -=TRUE=-'
        return true