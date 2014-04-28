(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/link'], function(Backbone, site, module, Link) {
    var Links, _ref;
    Links = (function(_super) {
      __extends(Links, _super);

      function Links() {
        _ref = Links.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Links.prototype.model = Link;

      Links.prototype.url = function() {
        return "/" + site.config.rest + "/links";
      };

      return Links;

    })(Backbone.Collection);
    return module.exports = Links;
  });

}).call(this);
