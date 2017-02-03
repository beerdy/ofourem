this.navigate = 
# Аналогично в coffe:
# @navigate =
  init: (argument) ->
    # body...
    return
  id: (it) ->
    action = $(it).attr('id')
    window.location.hash = ''
    switch action
      when 'elementAdd'
        alert 'addContainer'
        ui.elementAdd.show()
        networking.elementAdd()
      else
        break
    return