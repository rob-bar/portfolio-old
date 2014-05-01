define [
  'module'
  'backbone'
  'helper'
  'site'
],
(module, Backbone, helper, site) ->
  class ProjectView extends Backbone.View
    tagName: "li"
    className: "work item"
    events:
      "click .likes" : "like"
      "click .inner" : "showproject"

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    showproject: (e) ->
      e.preventDefault()
      site.vent.trigger 'showproject', @model

    initialize: ->

    render: ->
      @$el.html helper.get_template "project", model: @model.toJSON()
      @

  module.exports = ProjectView
