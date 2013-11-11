(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/link', 'model/pic', 'model/repo', 'model/project', 'model/tweet', 'model/item'], function(Backbone, site, module, Link, Pic, Repo, Project, Tweet, Item) {
    var All, _ref;
    All = (function(_super) {
      __extends(All, _super);

      function All() {
        _ref = All.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      All.prototype.model = Item;

      All.prototype.url = function() {
        return "/" + site.config.rest + "/all";
      };

      All.prototype.parse = function(resp, xhr) {
        return _.map(resp, function(attrs) {
          switch (attrs.kind) {
            case 'link':
              return new Link(attrs);
            case 'pic':
              return new Pic(attrs);
            case 'repo':
              return new Repo(attrs);
            case 'work':
              return new Project(attrs);
            case 'tweet':
              return new Tweet(attrs);
          }
        });
      };

      return All;

    })(Backbone.Collection);
    return module.exports = All;
  });

}).call(this);
