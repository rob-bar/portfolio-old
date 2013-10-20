define ['backbone','underscore','jquery', 'router', 'site'],
(Backbone, _, $, AppRouter, site) ->

  $ ->
    site.router = new AppRouter()
    # Backbone.emulateJSON = true
    # Backbone.emulateHTTP = true

    _.each $(".repoinfo"), (repo) ->
      if $(repo).text().length > 18
        $(repo).addClass "smaller"

    $('.likes').click (e) ->
      e.preventDefault()
      $(e.currentTarget).addClass "liked"

    $('.work').click (e) ->
      e.preventDefault()
      unless $('#all li').eq(0).hasClass "inback"
        $('#all li').each () ->
          setTimeout =>
            $(@).addClass "inback"
          , $(@).offset().top * 0.75
      else
        $('#all li').each () ->
          setTimeout =>
            $(@).removeClass "inback"
          , $(@).offset().top * 0.75

