define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class ProjectDetailView extends Backbone.View
    tagName: "article"
    className: "workdetail"
    events: {}

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    render: (model) ->
      @model = model
      console.log @model.toJSON()
      @$el.html helper.get_template "projectdetail", model: @model.toJSON()
      @$el.addClass "show"

      @


  module.exports = ProjectDetailView
