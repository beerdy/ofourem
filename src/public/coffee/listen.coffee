this.listen = 

  element: new Object
 
  init: () ->
    @element_()

  element_: () ->
    @element = 
      #state: state.element.add
      #error: error.element.add # Ссылкой
      #inspector: inspector.element.add
      #pp: window.O4.pp.element.add # Так же ссылкой

      add: () ->
        dothis = (obj,variable,value) ->
          if state.element.add[variable][value]==false
            if inspector.element.add[variable][value](obj)==false
              state.element.add[variable][value] = true
              
              _listner = () ->
                if inspector.element.add[variable][value] this
                  this.removeEventListener 'keyup', _listner, false

                  state.element.add[variable][value] = false

                  console.log 'remove - inspector.element.add.text.min_length listner'
              console.log 'add - inspector.element.add.text.min_length listner'

              obj.addEventListener 'keyup', _listner, false
              return false
          else
            return true
          

        obj = document.getElementById 't1'
        
        dothis(obj, 'text', 'max_length')
        dothis( obj, 'text', 'min_length')
        

        ###
        if state.element.add.text.max_length==false and inspector.element.add.text.max_length(obj)==false
          state.element.add.text.max_length = true
          
          _listner = () ->
            if inspector.element.add.text.max_length this
              this.removeEventListener 'keyup', _listner, false
              state.element.add.text.max_length = false
          obj.addEventListener 'keyup', _listner, false
          return false

        env.element.add['t1'] = obj.value
        

        for i in [1..env.element.add.c]
          field = 'f'+i

          obj = document.getElementById field

          if state.element.add.field.min_length==false and inspector.element.add.field.min_length(obj)==false
            state.element.add.field.min_length = true

            _listner = () ->
              if inspector.element.add.field.min_length this
                this.removeEventListener 'keyup', _listner, false
                state.element.add.field.min_length = false
                console.log 'remove - inspector.element.add.field.min_length listner'
            console.log 'add - inspector.element.add.field.min_length listner'
            obj.addEventListener 'keyup', _listner, false
            return false

            if length > @pp.field.max_length
              @error.field.max_length obj, true 
              return false
          
          env.element.add[field] = obj.value
        ###  

        console.log 'Inspection>>> element add: -=TRUE=-'
        return true