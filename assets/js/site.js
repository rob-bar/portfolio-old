(function() {
  define(['module', 'underscore', 'backbone'], function(module, _, Backbone) {
    var site;
    site = {
      config: {
        rest: "rest",
        mousesover: true
      },
      vent: _.extend({}, Backbone.Events)
    };
    return module.exports = site;
  });

}).call(this);
