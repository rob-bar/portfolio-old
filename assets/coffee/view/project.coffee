define [
  'module'
  'backbone'
  'helper'
  'site'
],
(module, Backbone, helper, site) ->
  class ProjectView extends Backbone.View
    tagName: "li"
    className: "work item hide"
    events:
      "click .likes" : "like"
      "click .inner" : "showproject"

    like: (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    showproject: (e) ->
      e.preventDefault()
      site.router.navigate "work/#{@model.slug()}"
      site.vent.trigger 'showproject', @model

    initialize: (options)->
      @place = options.place

    in_viewport: () ->
      helper.in_view_port @el

    in_view_port_full: () ->
      helper.in_view_port_full @el

    render: ->
      @$el.html helper.get_template "project", model: @model.toJSON()
      @

  module.exports = ProjectView
