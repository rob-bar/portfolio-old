(function() {
  define(['backbone', 'underscore', 'jquery', 'router', 'site'], function(Backbone, _, $, AppRouter, site) {
    return $(function() {
      site.router = new AppRouter();
      _.each($(".repoinfo"), function(repo) {
        if ($(repo).text().length > 18) {
          return $(repo).addClass("smaller");
        }
      });
      $('.likes').click(function(e) {
        e.preventDefault();
        return $(e.currentTarget).addClass("liked");
      });
      return $('.work').click(function(e) {
        e.preventDefault();
        if (!$('#all li').eq(0).hasClass("inback")) {
          return $('#all li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).addClass("inback");
            }, $(this).offset().top * 0.75);
          });
        } else {
          return $('#all li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).removeClass("inback");
            }, $(this).offset().top * 0.75);
          });
        }
      });
    });
  });

}).call(this);
