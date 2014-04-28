define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/repos'
  'view/repo'
],
(module, Backbone, helper, site, Repos, RepoView) ->
  class ReposView extends Backbone.View
    tagName: "ul"
    attributes:
      id: "repos"

    events: {}

    initialize: ->

    render: ->
      @collection = new Repos()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new RepoView model: model
            @$el.append view.render().$el
      @
  module.exports = ReposView
