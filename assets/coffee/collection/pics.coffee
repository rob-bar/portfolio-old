define [
  'backbone'
  'site'
  'module'
  'model/pic'
],
(Backbone, site, module) ->

  class Pics extends Backbone.Collection
    model: Pic
    url: -> "/#{site.config.rest}/pics"

  module.exports = Pics
