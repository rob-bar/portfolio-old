define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Pic extends Backbone.View
    tagName: "li"
    className: "pic rect item"
    events: {}
    initialize: ->
    render: ->
      @$el.html helper.get_template "pic", {model: @model.toJSON()}
      @
  module.exports = Pic
