define ['module', 'jquery', 'backbone', '../templates/templates'],
(module, $, Backbone) ->

  helper =
    intro_done: false
    get_template: (name, data) ->
      return JST["assets/templates/#{name}"](data)

    track_page: ->
      _gaq = window._gaq || []
      frag = Backbone.history.getFragment()
      _gaq.push(['_trackPageview', "/#{frag}"])

    project_colls: ->
      $("#main").width() / 320

    animation_factor: ->
      @project_colls() * 25

    animation_delay: (index)->
      ((index * 100) / @animation_factor()) * 100

    zero_fill: (i) ->
      ret = if (i < 10) then '0' else ''
      ret + i

    in_view_port: (el) ->
      rect = el.getBoundingClientRect()
      return ( rect.top >= 0 and rect.left >= 0 and (rect.top + ((rect.bottom - rect.top) * .25)) <= (window.innerHeight || document.documentElement.clientHeight) and rect.right <= (window.innerWidth || document.documentElement.clientWidth))

    in_view_port_full: (el) ->
      rect = el.getBoundingClientRect()
      return ( rect.top >= 0 and rect.left >= 0 and rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) and rect.right <= (window.innerWidth || document.documentElement.clientWidth))

    scroll_to: (target) ->
      if $(target).offset()?
        topoffset = 55
        speed = 600
        destination = $(target).offset().top - topoffset

        $('html:not(:animated),body:not(:animated)').animate(
          {scrollTop: destination}
          speed
          ->
            $(document).scrollTop(destination)
        )
      return false

    set_height: (collection, el, colls) ->
      _.debounce ->
        height = Math.ceil(collection.length / colls) * 160
        el.css "height", "#{height}px"
      , 300

  module.exports = helper
