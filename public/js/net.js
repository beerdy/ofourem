// Generated by CoffeeScript 1.12.3
(function() {
  var stdAjax;

  this.net = {
    element: new Object,
    init: function(argument) {
      return this.element_();
    },
    element_: function() {
      return this.element = {
        add: function() {
          return stdAjax(env.client.action, env.client.params);
        }
      };
    }
  };

  console.log('ready');

  stdAjax = function(action, params) {
    params['j'] = 1;
    console.log('send to server:', params);
    return $.ajax({
      type: 'POST',
      url: '/' + action,
      async: true,
      contentType: 'application/json; charset=UTF-8',
      data: JSON.stringify(params),
      success: function(s) {
        console.log('server asked:', 'oooo');
      },
      beforeSend: function() {}
    });
  };

}).call(this);
