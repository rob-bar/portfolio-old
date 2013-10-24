define [
  'backbone'
  'site'
  'module'
  'model/tweet'
],
(Backbone, site, module) ->

  class Tweets extends Backbone.Collection
    model: Tweet
    url: -> "/#{site.config.rest}/tweets"

  module.exports = Tweets
