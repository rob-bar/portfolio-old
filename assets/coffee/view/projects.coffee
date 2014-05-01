define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/projects'
  'view/project'
],
(module, Backbone, helper, site, Projects, ProjectView) ->
  class ProjectsView extends Backbone.View
    tagName: "ul"
    attributes:
      id: "projects"

    events:
      "click li": "toggle"

    initialize: ->

    toggle: (e) ->
      e.preventDefault()
      clickecoffset = $(e.currentTarget).offset().top

      unless $('li').eq(0).hasClass "inback"
        $('li').each () ->
          setTimeout =>
            $(@).addClass "inback"
          , Math.abs(clickecoffset - $(@).offset().top) * 1

      else
        $('li').each () ->
          setTimeout =>
            $(@).removeClass "inback"
          , Math.abs(clickecoffset - $(@).offset().top) * 1

    render: ->
      @collection = new Projects()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new ProjectView model: model
            @$el.append view.render().$el
      @

  module.exports = ProjectsView
