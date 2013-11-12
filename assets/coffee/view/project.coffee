define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Project extends Backbone.View
    tagName: "li"
    className: "work item"
    events: {}
    initialize: ->
    render: ->
      @$el.html helper.get_template "project", model: @model.toJSON()
      @
  module.exports = Project
