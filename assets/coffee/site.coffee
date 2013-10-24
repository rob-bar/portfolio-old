define [
  'module'
  'underscore'
  'backbone'
],
(module, _, Backbone) ->
  site =
    config:
      rest: "rest"
      mousesover: true
    vent: _.extend {}, Backbone.Events

  module.exports = site
