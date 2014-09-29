define [
  'module'
  'backbone'
  'helper'
  'model/project'
],
(module, Backbone, helper, Project) ->
  class ProjectDetailView extends Backbone.View
    tagName: "article"
    className: "workdetail"
    events:
      "click .close": "close"

    initialize: ->
      @render(new Project())

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    close: (e) ->
      e.preventDefault()
      @$el.removeClass "show"

    render: (model) ->
      @model = model
      console.log @model.toJSON()
      @$el.html helper.get_template "projectdetail", model: @model.toJSON()
      @$el.addClass "show"

      @


  module.exports = ProjectDetailView
