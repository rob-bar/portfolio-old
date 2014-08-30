(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site'], function(module, Backbone, helper, site) {
    var ProjectView, _ref;
    ProjectView = (function(_super) {
      __extends(ProjectView, _super);

      function ProjectView() {
        _ref = ProjectView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ProjectView.prototype.tagName = "li";

      ProjectView.prototype.className = "work item hide";

      ProjectView.prototype.events = {
        "click .likes": "like",
        "click .inner": "showproject"
      };

      ProjectView.prototype.like = function(e) {
        e.preventDefault();
        return $(e.currentTarget).addClass("liked");
      };

      ProjectView.prototype.showproject = function(e) {
        return e.preventDefault();
      };

      ProjectView.prototype.initialize = function(options) {
        return this.place = options.place;
      };

      ProjectView.prototype.in_viewport = function() {
        return helper.in_view_port(this.el);
      };

      ProjectView.prototype.in_view_port_full = function() {
        return helper.in_view_port_full(this.el);
      };

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
