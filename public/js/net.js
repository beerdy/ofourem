// Generated by CoffeeScript 1.12.3
(function() {
  var stdAjax;

  this.net = {
    element: new Object,
    elements: new Object,
    vk: new Object,
    init: function(argument) {
      this.element_();
      this.elements_();
      return this.vk_();
    },
    element_: function() {
      return this.element = {
        add: function() {
          return stdAjax(env.element.add);
        },
        read: function() {
          return stdAjax(new Object);
        }
      };
    },
    elements_: function() {
      return this.elements = {
        read: function() {
          return stdAjax(new Object);
        }
      };
    },
    vk_: function() {
      return this.vk = {
        auth: function() {
          return stdAjax(new Object, ui.vk.auth.show);
        }
      };
    },
    test_json: function() {
      return stdAjax(new Object, ui.test_json);
    }
  };

  stdAjax = function(params, callback) {
    params['j'] = 1;
    params['action'] = env.client.action;
    return $.ajax({
      type: 'POST',
      url: '/' + env.client.action,
      async: true,
      contentType: 'application/json; charset=UTF-8',
      data: JSON.stringify(params),
      success: function(s) {
        var e, writecity;
        if (s) {
          try {
            env.response_original = s;
            env.response = JSON.parse(s);
            writecity = document.createTextNode(s);
            document.getElementById("textAreaID").appendChild(writecity);
            return state.response = true;
          } catch (error1) {
            e = error1;
            state.response = false;
            return error.response(e);
          }
        }
      },
      beforeSend: function() {
        return console.log('REQUEST:', params);
      }
    }).done(function() {
      console.log('212 Asked:', env.response);
      callback.call();
    });
  };

}).call(this);
