define ['module', 'jquery', 'backbone'],
(module, $, Backbone) ->

  helper =
    get_template: (name, data) ->
      return JST["assets/templates/#{name}"](data)

    track_page: ->
      _gaq = window._gaq || []
      frag = Backbone.history.getFragment()
      _gaq.push(['_trackPageview', "/#{frag}"])

  module.exports = helper
