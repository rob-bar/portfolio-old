(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site'], function(module, Backbone, helper, site) {
    var Me, _ref;
    Me = (function(_super) {
      __extends(Me, _super);

      function Me() {
        this.render = __bind(this.render, this);
        _ref = Me.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Me.prototype.tagName = "div";

      Me.prototype.attributes = {
        id: "me"
      };

      Me.prototype.events = {};

      Me.prototype.initialize = function() {};

      Me.prototype.render = function() {
        var _this = this;
        return $.ajax("/rest/grav", {
          method: "get",
          success: function(data, textStatus, jqXHR) {
            _this.$el.html(helper.get_template("me", {
              grav: data
            }));
            return site.vent.trigger('grav');
          }
        });
      };

      return Me;

    })(Backbone.View);
    return module.exports = Me;
  });

}).call(this);
