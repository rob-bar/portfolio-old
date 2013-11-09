(function() {
  define(['module', 'jquery', 'backbone', '../templates/templates'], function(module, $, Backbone) {
    var helper;
    helper = {
      get_template: function(name, data) {
        return JST["assets/templates/" + name](data);
      },
      track_page: function() {
        var frag, _gaq;
        _gaq = window._gaq || [];
        frag = Backbone.history.getFragment();
        return _gaq.push(['_trackPageview', "/" + frag]);
      }
    };
    return module.exports = helper;
  });

}).call(this);
