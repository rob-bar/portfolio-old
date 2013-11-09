(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/repo'], function(Backbone, site, module, Repo) {
    var Repos, _ref;
    Repos = (function(_super) {
      __extends(Repos, _super);

      function Repos() {
        _ref = Repos.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Repos.prototype.model = Repo;

      Repos.prototype.url = function() {
        return "/" + site.config.rest + "/repos";
      };

      return Repos;

    })(Backbone.Collection);
    return module.exports = Repos;
  });

}).call(this);
