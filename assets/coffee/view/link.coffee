define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Link extends Backbone.View
    tagName: "li"
    className: "link rect item"
    events: {}
    initialize: ->
    render: ->
      @$el.html helper.get_template("link", {model: @model.toJSON()})
      @
  module.exports = Link