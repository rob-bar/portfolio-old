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
    attributes:
      id: "links"
    events: {}

    initialize: ->
      # @render()

    render: ->
      @collection = new Links()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new LinkView model: model
            @$el.append view.render().$el
      @

  module.exports = LinksView
