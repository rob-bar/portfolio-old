define [
  'backbone'
  'site'
  'module'
  'model/project'
],
(Backbone, site, module, Project) ->

  class Projects extends Backbone.Collection
    model: Project
    url: -> "/#{site.config.rest}/works"

  module.exports = Projects
