(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Project, _ref;
    Project = (function(_super) {
      __extends(Project, _super);

      function Project() {
        _ref = Project.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Project.prototype.tagName = "li";

      Project.prototype.className = "work item";

      Project.prototype.events = {
        "click .likes": "like"
      };

      Project.prototype.like = function(e) {
        e.preventDefault();
        return $(e.currentTarget).addClass("liked");
      };

      Project.prototype.initialize = function() {};

      Project.prototype.render = function() {
        this.$el.html(helper.get_template("project", {
          model: this.model.toJSON()
        }));
        return this;
      };

      return Project;

    })(Backbone.View);
    return module.exports = Project;
  });

}).call(this);
