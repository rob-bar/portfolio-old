define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/links'
  'view/link'
],
(module, Backbone, helper, site, Links, LinkView) ->
  class LinksView extends Backbone.View
    tagName: "ul"
    className: "perspective"
    views: []
    attributes:
      id: "links"

    events: {}

    initialize: ->

    render: ->
      @collection = new Links()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new LinkView model: model, place: index
            view.render()
            @views.push view
            @$el.append view.$el

            if index is (list.length - 1)
              helper.set_height(@collection, @$el, helper.project_colls() * 2)()
      @

    in_viewport: ->
      _.each @views, (view, index) ->
        if view.in_view_port_full()
          factor = view.place % (helper.project_colls() * 2)
          setTimeout ->
            view.$el.removeClass "hide"
          , helper.animation_delay(factor)

  module.exports = LinksView
