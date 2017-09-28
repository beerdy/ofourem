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
        env.client.action = 'element_add'
        controller.element.add()
      when 'elementFieldAppend'
        controller.element.field.append()
      when 'elementFieldRemove'
        controller.element.field.remove()

      when 'elementRead'
        controller.element.read()
      when 'elementsRead'
        env.client.action = 'elements_read'
        controller.elements.read()

      when 'vkAuth'
        env.client.action = 'vk_auth'
        controller.vk.auth()
      when 'test_json'
        env.client.action = 'test_json'
        controller.test_json()
      else
        break
