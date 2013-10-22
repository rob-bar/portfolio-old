define ['module','underscore','backbone'],
(module, _, Backbone) ->
  site =
    config:
      mousesover: true
    vent: _.extend {}, Backbone.Events

  module.exports = site
