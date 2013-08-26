$ ->
  _.each $(".repoinfo"), (repo)->
    if $(repo).text().length > 18
      $(repo).addClass "smaller"

  $(".work").mousemove (e) ->
    pos = $(e.currentTarget).offset()
    relX = e.pageX - pos.left
    relY = e.pageY - pos.top