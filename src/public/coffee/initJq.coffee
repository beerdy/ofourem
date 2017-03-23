jQuery(document).ready ->
  O4.init()
  ui.init()
  env.init()
  state.init()
  error.init()
  inspector.init()
  controller.init()
  net.init()

  listen.init
    'text': 
      'struct':'text'
      'id':'t1'
    'field':
      'struct':'field'
      'idPrefix':'f'

  console.log '!!!INIT OK!!!'
  return