define ['site'],
(site) ->
  $ ->
    $('#nav .scroll').click (e) ->
      e.preventDefault()
      frag = $(e.currentTarget).attr "href"
      site.router.navigate frag, {trigger: true}
