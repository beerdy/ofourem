this.navigate = 
# Аналогично в coffe:
# @navigate =
  init: (argument) ->
    # body...
    return
  id: (it) ->
    action = it.getAttribute 'id'
    window.location.hash = ''
    switch action
      when 'showElementAdd'
        ui.elementAdd.show()
      when 'elementAdd'
        env.client.action = action
        controller.element.add()
      else
        break
