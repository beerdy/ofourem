this.listen = 

  element: new Object
 
  init: () ->
    @element_()

  element_: () ->
    @element = 
      tmp: new Object
      #state: state.element.add
      #error: error.element.add # Ссылкой
      #inspector: inspector.element.add
      #pp: window.O4.pp.element.add # Так же ссылкой

      add: () ->
        obj = document.getElementById 't1'

        if state.element.add.text.range_length==false and inspector.element.add.text.range_length(obj)==false
          state.element.add.text.range_length = true
          error.element.add.text.range_length obj, true
          @tmp = 
            _func: () ->
              if inspector.element.add.text.range_length this
                this.removeEventListener 'keyup', _func, false
                state.element.add.text.range_length = false
                error.element.add.text.range_length this, false
                console.log 'remove - inspector.element.add.text.range_length listner' 
          
          console.log 'add - inspector.element.add.text.range_length listner'
          obj.addEventListener 'keyup', @tmp._func, false
          delete @tmp._func
          
        for i in [1..env.element.add.c]

          field = 'f'+i
          obj = document.getElementById field
          
          if state.element.add.field.range_length==false and inspector.element.add.field.range_length(obj)==false
            state.element.add.field.range_length = true
            error.element.add.field.range_length obj, true
            @tmp =
              _func: () ->
                if inspector.element.add.field.range_length this
                  this.removeEventListener 'keyup', _func, false
                  state.element.add.field.range_length = false
                  error.element.add.field.range_length this, false
            obj.addEventListener 'keyup', @tmp._func, false
            delete @tmp._func
        
        

        ###
        if state.element.add.text.max_length==false and inspector.element.add.text.max_length(obj)==false
          state.element.add.text.max_length = true
          
          _func = () ->
            if inspector.element.add.text.max_length this
              this.removeEventListener 'keyup', _func, false
              state.element.add.text.max_length = false
          obj.addEventListener 'keyup', _func, false
          return false

        env.element.add['t1'] = obj.value
        

        for i in [1..env.element.add.c]
          field = 'f'+i

          obj = document.getElementById field

          if state.element.add.field.min_length==false and inspector.element.add.field.min_length(obj)==false
            state.element.add.field.min_length = true

            _func = () ->
              if inspector.element.add.field.min_length this
                this.removeEventListener 'keyup', _func, false
                state.element.add.field.min_length = false
                console.log 'remove - inspector.element.add.field.min_length listner'
            console.log 'add - inspector.element.add.field.min_length listner'
            obj.addEventListener 'keyup', _func, false
            return false

            if length > @pp.field.max_length
              @error.field.max_length obj, true 
              return false
          
          env.element.add[field] = obj.value
        ###  

        console.log 'Inspection>>> element add: -=TRUE=-'
        return true