(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var AppRouter, _ref;
    AppRouter = (function(_super) {
      __extends(AppRouter, _super);

      function AppRouter() {
        _ref = AppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      AppRouter.prototype.routes = {
        "route:before": "before",
        "route:after": "after"
      };

      AppRouter.prototype.initialize = function() {
        return this.bind('route', helper.track_page);
      };

      AppRouter.prototype.index = function() {};

      AppRouter.prototype.before = function() {};

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
