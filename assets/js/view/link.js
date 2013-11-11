(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Link, _ref;
    Link = (function(_super) {
      __extends(Link, _super);

      function Link() {
        _ref = Link.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Link.prototype.tagName = "li";

      Link.prototype.className = "link rect item";

      Link.prototype.events = {};

      Link.prototype.initialize = function() {};

      Link.prototype.render = function() {
        this.$el.html(helper.get_template("link", {
          model: this.model.toJSON()
        }));
        return this;
      };

      return Link;

    })(Backbone.View);
    return module.exports = Link;
  });

}).call(this);
