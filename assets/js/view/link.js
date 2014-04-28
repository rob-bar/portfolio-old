(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var LinkView, _ref;
    LinkView = (function(_super) {
      __extends(LinkView, _super);

      function LinkView() {
        _ref = LinkView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      LinkView.prototype.tagName = "li";

      LinkView.prototype.className = "link rect item";

      LinkView.prototype.events = {};

      LinkView.prototype.initialize = function() {};

      LinkView.prototype.render = function() {
        this.$el.html(helper.get_template("link", {
          model: this.model.toJSON()
        }));
        return this;
      };

      return LinkView;

    })(Backbone.View);
    return module.exports = LinkView;
  });

}).call(this);
