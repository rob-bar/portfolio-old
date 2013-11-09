define [
  'module'
  'backbone'
  'helper'
  'view/me'
  'site'
],
(module, Backbone, helper, MeView, site) ->
  class Main extends Backbone.View
    tagName: "div"
    attributes:
      id: "all"
    events: {}
    initialize: ->
      site.vent.on 'grav', @grav
      @me = new MeView()
      @me.render()

    grav: =>
      @$el.append @me.$el
  module.exports = Main
