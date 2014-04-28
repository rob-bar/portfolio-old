define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class ProjectDetailView extends Backbone.View
    tagName: "article"
    className: "work"
    events: {}


    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    initialize: ->

    render: ->
      @$el.html helper.get_template "projectdetail", model: @model.toJSON()
      @

  module.exports = ProjectDetailView
