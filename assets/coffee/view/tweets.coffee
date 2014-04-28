define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/tweets'
  'view/tweet'
],
(module, Backbone, helper, site, Tweets, TweetView) ->
  class TweetsView extends Backbone.View
    tagName: "ul"
    attributes:
      id: "tweets"

    events: {}

    initialize: ->
      # @render()

    render: ->
      @collection = new Tweets()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new TweetView model: model
            @$el.append view.render().$el
      @
  module.exports = TweetsView
