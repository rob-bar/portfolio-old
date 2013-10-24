(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Pic, _ref;
    Pic = (function(_super) {
      __extends(Pic, _super);

      function Pic() {
        _ref = Pic.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Pic.prototype.defaults = {
        title: "Unknown title",
        url: "http://404.com",
        image_small: "http://404.com",
        image_large: "http://404.com"
      };

      return Pic;

    })(Backbone.Model);
    return module.exports = Pic;
  });

}).call(this);
