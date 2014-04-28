(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'site', 'module', 'model/tweet'], function(Backbone, site, module, Tweet) {
    var Tweets, _ref;
    Tweets = (function(_super) {
      __extends(Tweets, _super);

      function Tweets() {
        _ref = Tweets.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Tweets.prototype.model = Tweet;

      Tweets.prototype.url = function() {
        return "/" + site.config.rest + "/tweets";
      };

      return Tweets;

    })(Backbone.Collection);
    return module.exports = Tweets;
  });

}).call(this);
