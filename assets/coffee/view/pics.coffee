define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/pics'
  'view/pic'
],
(module, Backbone, helper, site, Pics,PicView) ->
  class PicsView extends Backbone.View
    tagName: "ul"
    className: "perspective"
    views: []
    attributes:
      id: "pics"

    events: {}

    initialize: ->

    render: ->
      @collection = new Pics()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new PicView model: model, place: index
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

  module.exports = PicsView
