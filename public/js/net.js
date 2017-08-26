// Generated by CoffeeScript 1.12.3
(function() {
  var stdAjax;

  this.net = {
    element: new Object,
    elements: new Object,
    init: function(argument) {
      this.element_();
      return this.elements_();
    },
    element_: function() {
      return this.element = {
        add: function() {
          return stdAjax();
        },
        read: function() {
          return stdAjax();
        }
      };
    },
    elements_: function() {
      return this.elements = {
        read: function() {
          return stdAjax();
        }
      };
    }
  };

  stdAjax = function() {
    env.client.params['j'] = 1;
    env.client.params['action'] = env.client.action;
    return $.ajax({
      type: 'POST',
      url: '/' + env.client.action,
      async: false,
      contentType: 'application/json; charset=UTF-8',
      data: JSON.stringify(env.client.params),
      success: function(s) {
        var e, writecity;
        if (s) {
          try {
            env.response = JSON.parse(s);
            console.log('200 Asked:', env.response);
            writecity = document.createTextNode(s);
            document.getElementById("textAreaID").appendChild(writecity);
            state.response = true;
          } catch (error1) {
            e = error1;
            state.response = false;
            error.response(e);
          }
        }
      },
      beforeSend: function() {
        return console.log('REQUEST:', env.client.params);
      }
    });
  };

}).call(this);
