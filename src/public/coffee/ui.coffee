this.ui =
  element: new Object
  elements: new Object

  init: (argument) -> 
    @element_()
    @elements_()

#Element - One
  element_: () ->
    @element = 
      container:
        show: () ->
          document.getElementById('elementAddContainer').style.display = "block"

#Elements - Many
  elements_: () ->
    @elements = 
      read:
        show: () ->
          document.getElementById('elementAddContainer').style.display = "block"
      

