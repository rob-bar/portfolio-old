(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var TweetView, _ref;
    TweetView = (function(_super) {
      __extends(TweetView, _super);

      function TweetView() {
        _ref = TweetView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TweetView.prototype.tagName = "li";

      TweetView.prototype.className = "tweet rect item";

      TweetView.prototype.events = {};

      TweetView.prototype.initialize = function() {};

      TweetView.prototype.render = function() {
        return helper.get_template("tweet")(this.model);
      };

      return TweetView;

    })(Backbone.View);
    return module.exports = TweetView;
  });

}).call(this);
