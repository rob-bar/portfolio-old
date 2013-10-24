define [
  'backbone'
  'site'
  'module'
  'model/link'
],
(Backbone, site, module) ->

  class Links extends Backbone.Collection
    model: Link
    url: -> "/#{site.config.rest}/links"

  module.exports = Links
