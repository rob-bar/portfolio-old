(function() {
  define(['module', 'jquery', 'backbone'], function(module, $, Backbone) {
    var helper;
    helper = {
      get_template: function(name) {},
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
