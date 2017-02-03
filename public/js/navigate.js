var navigate = {
  init: function (argument) {
    // body...
  },

  id: function(it) {
    var action = $(it).attr("id");

    window.location.hash = '';
    
    switch(action){
    case 'elementAdd':
      alert('addContainer');
      break;
    default:
      break;
    }
  }
}

