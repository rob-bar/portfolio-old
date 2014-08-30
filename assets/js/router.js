(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'view/main'], function(module, Backbone, helper, site, MainView) {
    var AppRouter, _ref;
    AppRouter = (function(_super) {
      __extends(AppRouter, _super);

      function AppRouter() {
        _ref = AppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      AppRouter.prototype.routes = {
        "route:before": "before",
        "route:after": "after",
        "": "index",
        "me": "me",
        "work": "work",
        "pics": "pics",
        "links": "links",
        "repos": "repos"
      };

      AppRouter.prototype.initialize = function() {
        this.bind('route', helper.track_page);
        this.listenTo(this, 'route:before', this.before);
        return this.listenTo(this, 'route:after', this.after);
      };

      AppRouter.prototype.index = function() {};

      AppRouter.prototype.me = function() {
        if (helper.intro_done) {
          return helper.scroll_to($("#main #me"));
        } else {
          return site.vent.on("intro_done", function() {
            return helper.scroll_to($("#main #me"));
          });
        }
      };

      AppRouter.prototype.repos = function() {
        if (helper.intro_done) {
          return helper.scroll_to($("#main #repos"));
        } else {
          return site.vent.on("intro_done", function() {
            return helper.scroll_to($("#main #repos"));
          });
        }
      };

      AppRouter.prototype.work = function() {
        if (helper.intro_done) {
          return helper.scroll_to($("#main #projects"));
        } else {
          return site.vent.on("intro_done", function() {
            return helper.scroll_to($("#main #projects"));
          });
        }
      };

      AppRouter.prototype.pics = function() {
        if (helper.intro_done) {
          return helper.scroll_to($("#main #pics"));
        } else {
          return site.vent.on("intro_done", function() {
            return helper.scroll_to($("#main #pics"));
          });
        }
      };

      AppRouter.prototype.links = function() {
        if (helper.intro_done) {
          return helper.scroll_to($("#main #links"));
        } else {
          return site.vent.on("intro_done", function() {
            return helper.scroll_to($("#main #links"));
          });
        }
      };

      AppRouter.prototype.before = function() {
        if (this.main == null) {
          this.main = new MainView();
          return $("body header").after(this.main.$el);
        }
      };

      AppRouter.prototype.after = function() {};

      AppRouter.prototype.route = function(route, name, callback) {
        if (callback == null) {
          callback = null;
        }
        if (!callback) {
          callback = this[name];
        }
        return AppRouter.__super__.route.call(this, route, name, function() {
          var result;
          this.trigger('route:before');
          result = callback && callback.apply(this, arguments);
          this.trigger('route:after');
          return result;
        });
      };

      return AppRouter;

    })(Backbone.Router);
    return module.exports = AppRouter;
  });

}).call(this);
