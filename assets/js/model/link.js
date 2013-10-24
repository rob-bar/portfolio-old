(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Link, _ref;
    Link = (function(_super) {
      __extends(Link, _super);

      function Link() {
        _ref = Link.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Link.prototype.defaults = {
        name: "Unknown name",
        description: "Unknown description",
        url: "http://404.com",
        tags: []
      };

      return Link;

    })(Backbone.Model);
    return module.exports = Link;
  });

}).call(this);
