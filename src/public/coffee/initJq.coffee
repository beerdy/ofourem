jQuery(document).ready ->
  O4.init()
  ui.init()
  env.init()
  error.init()
  net.init()
  controller.init()
  inspection.init()

  # console.log JSON.parse(window.O4.tt.issue.element_add)
  console.log '!!!INIT OK!!!'
  return