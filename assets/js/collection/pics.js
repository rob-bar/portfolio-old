(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/pic'], function(Backbone, site, module, Pic) {
    var Pics, _ref;
    Pics = (function(_super) {
      __extends(Pics, _super);

      function Pics() {
        _ref = Pics.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Pics.prototype.model = Pic;

      Pics.prototype.url = function() {
        return "/" + site.config.rest + "/pics";
      };

      return Pics;

    })(Backbone.Collection);
    return module.exports = Pics;
  });

}).call(this);
