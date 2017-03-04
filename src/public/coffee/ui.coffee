this.ui =
  elementAdd: new Object

  init: () ->
    @elementAdd_()

  elementAdd_: () ->
    container = 'elementAddContainer'
    @elementAdd =
      show: () ->
        document.getElementById(container).style.display = "block"
