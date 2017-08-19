this.navigate = 
# Аналогично в coffe:
# @navigate =
  init: (argument) ->
    # body...
    return
  id: (it) ->
    env.client.action = it.getAttribute 'id'
    window.location.hash = ''
    switch env.client.action
      when 'elementAddShow'
        ui.element.container.show()
      when 'elementAdd'
        controller.element.add()
      when 'elementFieldAppend'
        controller.element.field.append()
      when 'elementFieldRemove'
        controller.element.field.remove()

      when 'elementRead'
        controller.element.read()
      when 'elementsRead'
        controller.elements.read()
        
      else
        break
