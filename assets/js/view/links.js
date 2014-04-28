(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'collection/links', 'view/link'], function(module, Backbone, helper, site, Links, LinkView) {
    var LinksView, _ref;
    LinksView = (function(_super) {
      __extends(LinksView, _super);

      function LinksView() {
        _ref = LinksView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      LinksView.prototype.tagName = "ul";

      LinksView.prototype.attributes = {
        id: "links"
      };

      LinksView.prototype.events = {};

      LinksView.prototype.initialize = function() {};

      LinksView.prototype.render = function() {
        var _this = this;
        this.collection = new Links();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new LinkView({
                model: model
              });
              return _this.$el.append(view.render().$el);
            });
          }
        });
        return this;
      };

      return LinksView;

    })(Backbone.View);
    return module.exports = LinksView;
  });

}).call(this);
