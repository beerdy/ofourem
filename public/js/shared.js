$( document ).ready(function() {
  var test = {
    elementAdd: function(){
      params = new Object();
      params['action'] = 'element_add';

      console.log('send to server:', params);      
      data = new Object();
      $.ajax({
        type: "POST",
        url: "/"+params['action'],
        async: false,
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(params),
        success: function(s){
          console.log('server asked:',JSON.parse(s))
        },
        beforeSend: function(){
        }
      });
    }
  },

  var navigate = {
    id: function(it) {
      var action = $(it).attr("id");

      window.location.hash = '';
      
      switch(action){
      case 'elementAdd':

        break;
      default:
        break;
      }
      return false;
    }
  }

});