(function() {
  define(['site', 'router'], function(site, AppRouter) {
    $(function() {
      site.router = new AppRouter();
      return Backbone.history.start({
        pushState: true
      });
    });
    return window.onload = function() {
      return setTimeout(function() {
        return scrollTo(0, 0);
      }, 100);
    };
  });

}).call(this);
