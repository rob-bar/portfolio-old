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

      ProjectsView.prototype.className = "perspective";

      ProjectsView.prototype.attributes = {
        id: "projects"
      };

      ProjectsView.prototype.views = [];

      ProjectsView.prototype.events = {
        "click li": "toggle"
      };

      ProjectsView.prototype.initialize = function() {};

      ProjectsView.prototype.toggle = function(e) {
        var clickecoffset;
        e.preventDefault();
        clickecoffset = $(e.currentTarget).offset().top;
        if (!$el.find('li').eq(0).hasClass("inback")) {
          return $el.find('li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).addClass("inback");
            }, Math.abs(clickecoffset - $(this).offset().top) * 1);
          });
        } else {
          return $el.find('li').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).removeClass("inback");
            }, Math.abs(clickecoffset - $(this).offset().top) * 1);
          });
        }
      };

      ProjectsView.prototype.intro = function() {
        return _.each(this.views, function(view, index, list) {
          return setTimeout(function() {
            if (view.in_viewport()) {
              view.$el.removeClass("hide");
              if (index === (list.length - 1)) {
                helper.intro_done = true;
                return site.vent.trigger("intro_done");
              }
            } else {
              helper.intro_done = true;
              site.vent.trigger("intro_done");
            }
          }, helper.animation_delay(index));
        });
      };

      ProjectsView.prototype.in_viewport = function() {
        return _.each(this.views, function(view, index) {
          var factor;
          if (view.in_view_port_full()) {
            factor = view.place % helper.project_colls();
            return setTimeout(function() {
              return view.$el.removeClass("hide");
            }, helper.animation_delay(factor));
          }
        });
      };

      ProjectsView.prototype.open_detail_by_slug = function(slug) {
        return site.vent.trigger('showproject', this.collection.get_by_slug(slug));
      };

      ProjectsView.prototype.render = function() {
        var _this = this;
        this.collection = new Projects();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new ProjectView({
                model: model,
                place: index
              });
              view.render();
              _this.views.push(view);
              _this.$el.append(view.$el);
              if (index === (list.length - 1)) {
                return helper.set_height(_this.collection, _this.$el, helper.project_colls())();
              }
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
