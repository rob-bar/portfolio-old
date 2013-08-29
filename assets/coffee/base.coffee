$ ->
  site =
    mousesover: true

  _.each $(".repoinfo"), (repo)->
    if $(repo).text().length > 18
      $(repo).addClass "smaller"

  $('.likes').click (e) ->
    e.preventDefault()
    console.log "clicked"
    $(e.currentTarget).addClass "liked"
