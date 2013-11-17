define ['backbone','underscore', 'jquery', 'site', 'router'],
(Backbone, _, $, site, AppRouter) ->

  $ ->
    site.router = new AppRouter()
    Backbone.history.start pushState: true
