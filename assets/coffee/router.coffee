define [
  'module'
  'backbone'
  'helper'
  'site'
  'view/main'
],
(module, Backbone, helper, site, MainView) ->

  class AppRouter extends Backbone.Router
    routes:
      "route:before": "before"
      "route:after": "after"
      "": "index"
      "me": "me"
      "work": "work"
      "pics": "pics"
      "links": "links"
      "repos": "repos"

    initialize: ->
      @bind 'route', helper.track_page
      @listenTo(@, 'route:before', @before)
      @listenTo(@, 'route:after', @after)

    # ======================================================================================================
    # ROUTES
    # ======================================================================================================
    index: ->

    me: ->
      if helper.intro_done
        helper.scroll_to $("#main #me")
      else
        site.vent.on "intro_done", ->
          helper.scroll_to $("#main #me")

    repos: ->
      if helper.intro_done
        helper.scroll_to $("#main #repos")
      else
        site.vent.on "intro_done", ->
          helper.scroll_to $("#main #repos")

    work: ->
      if helper.intro_done
        helper.scroll_to $("#main #projects")
      else
        site.vent.on "intro_done", ->
          helper.scroll_to $("#main #projects")

    pics: ->
      if helper.intro_done
        helper.scroll_to $("#main #pics")
      else
        site.vent.on "intro_done", ->
          helper.scroll_to $("#main #pics")

    links: ->
      if helper.intro_done
        helper.scroll_to $("#main #links")
      else
        site.vent.on "intro_done", ->
          helper.scroll_to $("#main #links")
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
