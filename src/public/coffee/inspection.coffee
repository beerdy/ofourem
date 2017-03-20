this.inspection = 
  element: new Object

  init: () ->
    @element_()

  element_: () ->
    @element =
      listen: new Object,
      add: () ->
        @listen = @listen || JSON.parse JSON.stringify(window.O4.pp.element.add)
        
        obj = document.getElementById 't1'

        console.log 'listen::',  @listen 

        @listen.params = (obj) ->
          value = obj.value
          length = value.length
          #console.log 'min_length', length, window.O4.pp.element.add.text.min_length

        @listen.text.min_length = () ->
          if length < window.O4.pp.element.add.text.min_length
            error.element.add.text.min_length obj, true
            return false

        @listen.text.max_length = () ->
          if length > window.O4.pp.element.add.text.max_length
            error.element.add.text.max_length obj, true
            return false

        env.element.add['t1'] = value
        
        for i in [1..env.element.add.c]
          field = 'f'+i
          obj = document.getElementById field
          value = obj.value
          length = value.length

          if length < window.O4.pp.element.add.field.min_length
            error.element.add.field.min_length obj, true
            return false
          if length > window.O4.pp.element.add.field.max_length
            error.element.add.field.max_length obj, true
            return false

          env.element.add[field] = obj.value

        console.log 'Inspection>>> element add: -=TRUE=-'
        return true