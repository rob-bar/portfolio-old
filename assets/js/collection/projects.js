(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/project'], function(Backbone, site, module, Project) {
    var Projects, _ref;
    Projects = (function(_super) {
      __extends(Projects, _super);

      function Projects() {
        _ref = Projects.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Projects.prototype.model = Project;

      Projects.prototype.url = function() {
        return "/" + site.config.rest + "/works";
      };

      Projects.prototype.get_by_slug = function(slug) {
        return _.find(this.models, function(project) {
          return project.slug() === slug;
        });
      };

      return Projects;

    })(Backbone.Collection);
    return module.exports = Projects;
  });

}).call(this);
