(function() {
  define(['site', 'router'], function(site, AppRouter) {
    return $(function() {
      site.router = new AppRouter();
      return Backbone.history.start({
        pushState: true
      });
    });
  });

}).call(this);
