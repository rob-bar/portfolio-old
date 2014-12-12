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
      "click .indic": "change_slide"

    initialize: ->
      @render(new Project())

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    close: (e) ->
      e.preventDefault()
      @$el.removeClass "show"

    change_slide: (e) ->
      e.preventDefault()
      $(e.currentTarget).toggleClass "active"
      $(e.currentTarget).siblings().removeClass "active"

      picture = @$el.find(".picture").eq $(e.currentTarget).index()
      picture.toggleClass "hidden"
      picture.siblings(".picture").addClass "hidden"

    render: (model) ->
      @model = model
      @$el.html helper.get_template "projectdetail", project: @model.attributes
      @$el.addClass "show"
      @


  module.exports = ProjectDetailView
