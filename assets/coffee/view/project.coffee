define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Project extends Backbone.View
    tagName: "li"
    className: "work item"
    events:
      "click .likes" : "like"

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    initialize: ->

    render: ->
      @$el.html helper.get_template "project", model: @model.toJSON()
      @

  module.exports = Project
