(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var PicView, _ref;
    PicView = (function(_super) {
      __extends(PicView, _super);

      function PicView() {
        _ref = PicView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      PicView.prototype.tagName = "li";

      PicView.prototype.className = "pic rect item";

      PicView.prototype.events = {};

      PicView.prototype.initialize = function() {};

      PicView.prototype.render = function() {
        this.$el.html(helper.get_template("pic", {
          model: this.model.toJSON()
        }));
        return this;
      };

      return PicView;

    })(Backbone.View);
    return module.exports = PicView;
  });

}).call(this);
