(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var ProjectView, _ref;
    ProjectView = (function(_super) {
      __extends(ProjectView, _super);

      function ProjectView() {
        _ref = ProjectView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ProjectView.prototype.tagName = "li";

      ProjectView.prototype.className = "work item";

      ProjectView.prototype.events = {
        "click .likes": "like"
      };

      ProjectView.prototype.like = function(e) {
        e.preventDefault();
        return $(e.currentTarget).addClass("liked");
      };

      ProjectView.prototype.initialize = function() {};

      ProjectView.prototype.render = function() {
        this.$el.html(helper.get_template("project", {
          model: this.model.toJSON()
        }));
        return this;
      };

      return ProjectView;

    })(Backbone.View);
    return module.exports = ProjectView;
  });

}).call(this);
