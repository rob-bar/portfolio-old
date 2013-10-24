define [
  'backbone'
  'site'
  'module'
  'model/project'
],
(Backbone, site, module, Repo) ->

  class Projects extends Backbone.Collection
    model: Project
    url: -> "/#{site.config.rest}/works"

  module.exports = Projects
