this.picker = 

  element: new Object
 
  init: (options) ->

    @element_ options

  element_: (options) ->

    @element = 
      add: () ->
        if inspector.element.add.field.range_count==false
          console.log 'Inspection count field >>> element add: -=FALSE see error validation=-'
          error.element.add.field.range_count true
          return false

        makeListner = (nameFunc,property,parameter) ->
          console.log 'SET Listner'
          @[nameFunc] = ->
            if inspector.element.add[property][parameter] this
              this.removeEventListener 'keyup', window[nameFunc], false
              state.element.add[property][parameter][nameFunc] = false
              error.element.add[property][parameter] this, false

        inspectAndSet = (inspected,struct,obj)->
          if (state.element.add[struct].range_length[inspected]==false or state.element.add[struct].range_length[inspected]==undefined) and inspector.element.add[struct].range_length(obj)==false
            makeListner inspected, struct, 'range_length' if state.element.add[struct].range_length[inspected]==undefined # Если функция прослушивания не существует - создадим ее
            obj.addEventListener 'keyup', window[inspected], false
            state.element.add[struct].range_length[inspected] = true
            error.element.add[struct].range_length obj, true
          else
            env.element.add[struct][inspected] = obj.value     

        checkState = (options) ->
          for s,o of options
            for k,v of state.element.add[s].range_length
              if v
                console.log 'Inspection STRUCT>>> element add: -=FALSE see error validation=-'
                return false
          console.log 'Inspection>>> element add: -=TRUE=-'
          return true

        # Inspect elements
        inspectAndSet options.text.id, 'text', document.getElementById options.text.id

        for i in [1..env.element.add.field.c]
          inspected = options.field.idPrefix+i
          obj = document.getElementById inspected
          break if obj==null
          inspectAndSet inspected, 'field', obj

        ## На фронте нет проверки на количество
        # Check validate
        return checkState options