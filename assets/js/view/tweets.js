(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'collection/tweets', 'view/tweet'], function(module, Backbone, helper, site, Tweets, TweetView) {
    var TweetsView, _ref;
    TweetsView = (function(_super) {
      __extends(TweetsView, _super);

      function TweetsView() {
        _ref = TweetsView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TweetsView.prototype.tagName = "ul";

      TweetsView.prototype.attributes = {
        id: "tweets"
      };

      TweetsView.prototype.events = {};

      TweetsView.prototype.initialize = function() {};

      TweetsView.prototype.render = function() {
        var _this = this;
        this.collection = new Tweets();
        this.collection.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = new TweetView({
                model: model
              });
              return _this.$el.append(view.render().$el);
            });
          }
        });
        return this;
      };

      return TweetsView;

    })(Backbone.View);
    return module.exports = TweetsView;
  });

}).call(this);
