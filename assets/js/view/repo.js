(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var RepoView, _ref;
    RepoView = (function(_super) {
      __extends(RepoView, _super);

      function RepoView() {
        _ref = RepoView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      RepoView.prototype.tagName = "li";

      RepoView.prototype.className = "repo rect item";

      RepoView.prototype.events = {};

      RepoView.prototype.initialize = function() {};

      RepoView.prototype.render = function() {
        this.$el.html(helper.get_template("repo", {
          model: this.model.toJSON()
        }));
        this.checksize();
        return this;
      };

      RepoView.prototype.checksize = function() {
        var $repo;
        $repo = this.$el.find(".repoinfo");
        if ($repo.text().length > 18) {
          return $repo.addClass("smaller");
        }
      };

      return RepoView;

    })(Backbone.View);
    return module.exports = RepoView;
  });

}).call(this);
