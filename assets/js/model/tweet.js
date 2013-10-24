(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Tweet, _ref;
    Tweet = (function(_super) {
      __extends(Tweet, _super);

      function Tweet() {
        _ref = Tweet.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Tweet.prototype.defaults = {
        id_str: 0,
        text: "Unknown text"
      };

      return Tweet;

    })(Backbone.Model);
    return module.exports = Tweet;
  });

}).call(this);
