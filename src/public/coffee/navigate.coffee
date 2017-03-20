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
        ui.elementAdd.show()
      when 'elementAdd'
        controller.element.add()
      when 'elementFieldAppend'
        controller.element.field.append()

      else
        break
