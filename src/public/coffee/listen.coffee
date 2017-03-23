this.listen = 

  element: new Object
 
  init: (options) ->

    @element_ options

  element_: (options) ->

    @element = 
      add: () ->
        setListner = (nameFunc,property,parameter) ->
          @[nameFunc] = ->
            if inspector.element.add[property][parameter] this
              this.removeEventListener 'keyup', window[nameFunc], false
              state.element.add[property][parameter][nameFunc] = false
              error.element.add[property][parameter] this, false
              #console.log 'remove - listner' 

        doInspect = (inspected,type,obj)->
          if (state.element.add[type].range_length[inspected]==false or state.element.add[type].range_length[inspected]==undefined) and inspector.element.add[type].range_length(obj)==false
            state.element.add[type].range_length[inspected] = true
            error.element.add[type].range_length obj, true
            setListner inspected, type, 'range_length'
            obj.addEventListener 'keyup', window[inspected], false
            #console.log 'add - listner'

        doInspect options.text.id, options.text.struct, document.getElementById options.text.id

        for i in [1..env.element.add.c]
          inspected = options.field.idPrefix+i
          obj = document.getElementById inspected
          doInspect inspected, options.field.struct, obj
        
        console.log 'Inspection>>> element add: -=TRUE=-'
        return true