define ['site', 'router'],
(site, AppRouter) ->
  $ ->
    site.router = new AppRouter()
    Backbone.history.start pushState: true

  window.onload = ->
    setTimeout ->
      scrollTo(0, 0)
     , 100
