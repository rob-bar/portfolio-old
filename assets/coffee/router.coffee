define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->

  class AppRouter extends Backbone.Router
    routes:
      "route:before": "before"
      "route:after": "after"

    initialize: ->
      @bind 'route', helper.track_page

    # ======================================================================================================
    # ROUTES
    # ======================================================================================================

    # ======================================================================================================
    # BEFORE @ AFTER
    # ======================================================================================================
    before: () ->
      # console.log "BEFORE"

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
