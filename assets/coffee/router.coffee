define [
  'module'
  'backbone'
  'helper'
  'view/main'
],
(module, Backbone, helper, MainView) ->

  class AppRouter extends Backbone.Router
    routes:
      "route:before": "before"
      "route:after": "after"
      "": "index"

    initialize: ->
      @bind 'route', helper.track_page
      @listenTo(@, 'route:before', @before)
      @listenTo(@, 'route:after', @after)

    # ======================================================================================================
    # ROUTES
    # ======================================================================================================
    index: ->
      @main

    # ======================================================================================================
    # BEFORE @ AFTER
    # ======================================================================================================
    before: ->
      # console.log "before"
      unless @main?
        @main = new MainView()
        $("body header").after @main.$el

    after: ->
      # console.log "AFTER"

    route: (route, name, callback = null) ->
      callback = @[name] if ! callback
      super route, name, ->
        @trigger 'route:before'
        result = callback && callback.apply(@, arguments)
        @trigger 'route:after'
        return result

  module.exports = AppRouter
