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

      Project.prototype.defaults = {
        title: "Unknown title",
        client: "Unknown client",
        type_id: 0,
        likes: 0,
        launch_date: new date(),
        description: "Unknown description",
        is_active: false,
        media: {},
        tags: []
      };

      return Project;

    })(Backbone.Model);
    return module.exports = Project;
  });

}).call(this);
