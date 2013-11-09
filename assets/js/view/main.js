(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'view/me', 'site'], function(module, Backbone, helper, MeView, site) {
    var Main, _ref;
    Main = (function(_super) {
      __extends(Main, _super);

      function Main() {
        this.grav = __bind(this.grav, this);
        _ref = Main.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Main.prototype.tagName = "div";

      Main.prototype.attributes = {
        id: "all"
      };

      Main.prototype.events = {};

      Main.prototype.initialize = function() {
        site.vent.on('grav', this.grav);
        this.me = new MeView();
        return this.me.render();
      };

      Main.prototype.grav = function() {
        return this.$el.append(this.me.$el);
      };

      return Main;

    })(Backbone.View);
    return module.exports = Main;
  });

}).call(this);
