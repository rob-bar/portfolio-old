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
    attributes:
      id: "pics"

    events: {}

    initialize: ->

    render: ->
      @collection = new Pics()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new PicView model: model
            @$el.append view.render().$el
      @

  module.exports = PicsView
