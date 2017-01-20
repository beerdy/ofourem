$( document ).ready(function() {
  var test = {
    pollAdd: function(){
      
      params = new Object();
      params['action'] = 'poll_add';

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
      case 'pollAdd':

        break;
      default:
        break;
      }
      return false;
    }
  }

});