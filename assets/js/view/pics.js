(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'collection/pics', 'view/pic'], function(module, Backbone, helper, site, Pics, PicView) {
    var PicsView, _ref;
    PicsView = (function(_super) {
      __extends(PicsView, _super);

      function PicsView() {
        _ref = PicsView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      PicsView.prototype.tagName = "ul";

      PicsView.prototype.attributes = {
        id: "pics"
      };

      PicsView.prototype.events = {};

      PicsView.prototype.initialize = function() {};

      PicsView.prototype.render = function() {
        var _this = this;
        this.collection = new Pics();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new PicView({
                model: model
              });
              return _this.$el.append(view.render().$el);
            });
          }
        });
        return this;
      };

      return PicsView;

    })(Backbone.View);
    return module.exports = PicsView;
  });

}).call(this);
