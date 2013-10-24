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
      helper.get_template("link")(@model)

  module.exports = Link
