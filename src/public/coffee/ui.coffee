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
          link = env.response
          #window.open link ,'VK - Авторизация','height=334,width=660'
          window.location.href = link
  test_json: () ->
    $("#textAreaID").empty().append env.response_original
    $('#json-renderer').empty().jsonViewer env.response
    return
