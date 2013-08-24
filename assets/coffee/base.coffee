$ ->
  _.each $(".repoinfo"), (repo)->
    if $(repo).text().length > 18
      $(repo).addClass "smaller"