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

      Project.prototype.relations = {
        "media": Backbone.Model
      };

      Project.prototype.defaults = {
        _id: 0,
        name: "Unknown Name",
        client: "Unknown client",
        type_id: 0,
        likes: 0,
        created_at: new Date(),
        description: "Unknown description",
        is_active: false,
        media: {
          thumb: "",
          big: "",
          pictures: [],
          videos: [],
          preview: ""
        },
        tags: [],
        month: function() {
          return helper.zero_fill(new Date(this.created_at).getMonth() + 1);
        },
        year: function() {
          return new Date(this.created_at).getFullYear();
        }
      };

      Project.prototype.slug = function() {
        return this.get("name").toLowerCase().replace(/\s/g, "-").replace(/[^\w-]+/g, "");
      };

      return Project;

    })(Backbone.Model);
    return module.exports = Project;
  });

}).call(this);
