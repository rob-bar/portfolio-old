define ['site', 'router'],
(site, AppRouter) ->
  $ ->
    site.router = new AppRouter()
    Backbone.history.start pushState: true
