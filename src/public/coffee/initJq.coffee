jQuery(document).ready ->
  O4.init()
  ui.init()
  env.init()
  net.init()
  controller.init()
  picker.init()

  alert 'init start'
  # console.log JSON.parse(window.O4.tt.issue.element_add)
  alert 'init finish'
  return