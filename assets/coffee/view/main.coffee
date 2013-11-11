define [
  'module'
  'backbone'
  'helper'
  'view/me'
  'site'
  'collection/all'
  'view/pic'
  'view/link'
  'view/project'
  'view/tweet'
  'view/repo'
],
(module, Backbone, helper, MeView, site, All, Pic, Link, Project, Tweet, Repo) ->
  class Main extends Backbone.View
    tagName: "div"
    attributes:
      id: "all"
    events: {}

    initialize: ->
      site.vent.on 'grav', @grav
      @me = new MeView()
      @me.render()

      @col = new All()
      @col.fetch
        success: (results) =>
          results.each (model) =>
            view = switch model.get 'kind'
              when 'link' then new Link model: model
              when 'pic' then new Pic model: model
              when 'repo' then new Repo model: model
              when 'work' then new Project model: model
              when 'tweet' then new Tweet model: model
            @$el.append view.render().$el


    grav: =>
      @$el.append @me.$el

  module.exports = Main
