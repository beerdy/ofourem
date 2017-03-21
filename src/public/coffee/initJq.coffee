jQuery(document).ready ->
  O4.init()
  ui.init()
  env.init()
  state.init()
  error.init()
  inspector.init()
  controller.init()
  net.init()
  listen.init()

  # console.log JSON.parse(window.O4.tt.issue.element_add)
  console.log '!!!INIT OK!!!'
  return