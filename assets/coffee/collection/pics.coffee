define [
  'backbone'
  'site'
  'module'
  'model/pic'
],
(Backbone, site, module, Pic) ->

  class Pics extends Backbone.Collection
    model: Pic
    url: -> "/#{site.config.rest}/pics"

  module.exports = Pics
