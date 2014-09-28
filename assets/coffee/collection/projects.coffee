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

    get_by_slug: (slug) ->
      _.find @models, (project) ->
        project.slug() is slug

  module.exports = Projects
