define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class TweetView extends Backbone.View
    tagName: "li"
    className: "tweet rect item"
    events: {}
    initialize: ->
    render: -> helper.get_template("tweet")(@model)

  module.exports = TweetView
