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
    className: "perspective"
    attributes:
      id: "projects"
    views: []
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

    intro: ->
      _.each @views, (view, index, list) ->
        setTimeout ->
          if view.in_viewport()
            view.$el.removeClass "hide"

            if index is (list.length - 1)
              helper.intro_done = true
              site.vent.trigger "intro_done"

          else
            helper.intro_done = true
            site.vent.trigger "intro_done"
            return
        , helper.animation_delay(index)

    in_viewport: ->
      _.each @views, (view, index) ->
        if view.in_view_port_full()
          factor = view.place % helper.project_colls()
          setTimeout ->
            view.$el.removeClass "hide"
          , helper.animation_delay(factor)

    render: ->
      @collection = new Projects()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new ProjectView model: model, place: index
            view.render()
            @views.push view
            @$el.append view.$el

            if index is (list.length - 1)
              helper.set_height(@collection, @$el, helper.project_colls())()
      @


  module.exports = ProjectsView
