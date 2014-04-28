(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'collection/repos', 'view/repo'], function(module, Backbone, helper, site, Repos, RepoView) {
    var ReposView, _ref;
    ReposView = (function(_super) {
      __extends(ReposView, _super);

      function ReposView() {
        _ref = ReposView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ReposView.prototype.tagName = "ul";

      ReposView.prototype.attributes = {
        id: "repos"
      };

      ReposView.prototype.events = {};

      ReposView.prototype.initialize = function() {};

      ReposView.prototype.render = function() {
        var _this = this;
        this.collection = new Repos();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new RepoView({
                model: model
              });
              return _this.$el.append(view.render().$el);
            });
          }
        });
        return this;
      };

      return ReposView;

    })(Backbone.View);
    return module.exports = ReposView;
  });

}).call(this);
