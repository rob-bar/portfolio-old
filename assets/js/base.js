(function() {
  define(['backbone', 'underscore', 'jquery', 'site', 'router'], function(Backbone, _, $, site, AppRouter) {
    return $(function() {
      site.router = new AppRouter();
      return Backbone.history.start({
        pushState: true
      });
    });
  });

}).call(this);
