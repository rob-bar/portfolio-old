(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'collection/projects', 'view/project'], function(module, Backbone, helper, site, Projects, ProjectView) {
    var ProjectsView, _ref;
    ProjectsView = (function(_super) {
      __extends(ProjectsView, _super);

      function ProjectsView() {
        _ref = ProjectsView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ProjectsView.prototype.tagName = "ul";

      ProjectsView.prototype.attributes = {
        id: "projects"
      };

      ProjectsView.prototype.events = {
        "click li": "toggle"
      };

      ProjectsView.prototype.initialize = function() {};

      ProjectsView.prototype.toggle = function(e) {
        var clickecoffset;
        e.preventDefault();
        clickecoffset = $(e.currentTarget).offset().top;
        if (!$('li').eq(0).hasClass("inback")) {
          return $('li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).addClass("inback");
            }, Math.abs(clickecoffset - $(this).offset().top) * 1);
          });
        } else {
          return $('li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).removeClass("inback");
            }, Math.abs(clickecoffset - $(this).offset().top) * 1);
          });
        }
      };

      ProjectsView.prototype.render = function() {
        var _this = this;
        this.collection = new Projects();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new ProjectView({
                model: model
              });
              return _this.$el.append(view.render().$el);
            });
          }
        });
        return this;
      };

      return ProjectsView;

    })(Backbone.View);
    return module.exports = ProjectsView;
  });

}).call(this);
