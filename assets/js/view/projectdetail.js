(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var ProjectDetailView, _ref;
    ProjectDetailView = (function(_super) {
      __extends(ProjectDetailView, _super);

      function ProjectDetailView() {
        _ref = ProjectDetailView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ProjectDetailView.prototype.tagName = "article";

      ProjectDetailView.prototype.className = "workdetail";

      ProjectDetailView.prototype.events = {};

      ProjectDetailView.prototype.like = function(e) {
        e.preventDefault();
        return $(e.currentTarget).addClass("liked");
      };

      ProjectDetailView.prototype.render = function(model) {
        this.model = model;
        this.$el.html(helper.get_template("projectdetail", {
          model: this.model.toJSON()
        }));
        this.$el.addClass("show");
        return this;
      };

      return ProjectDetailView;

    })(Backbone.View);
    return module.exports = ProjectDetailView;
  });

}).call(this);
