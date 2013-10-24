define [
  'backbone'
  'site'
  'module'
  'model/repo'
],
(Backbone, site, module, Repo) ->

  class Repos extends Backbone.Collection
    model: Repo
    url: -> "/#{site.config.rest}/repos"

  module.exports = Repos
