this.ui =
  element: new Object
  elements: new Object

  init: (argument) -> 
    @element_()
    @elements_()
    @vk_()

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

  vk_: () ->
    @vk = 
      auth:
        show: () ->
          alert 'show'
          link = env.response
          iframe = document.createElement 'iframe'
          iframe.frameBorder=0
          iframe.width="300px"
          iframe.height="250px"
          iframe.id="randomid"
          iframe.setAttribute "src", link
          document.getElementById("iframeID").appendChild iframe
          alert 'enddob'      

