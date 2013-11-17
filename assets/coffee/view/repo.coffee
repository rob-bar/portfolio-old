define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Repo extends Backbone.View
    tagName: "li"
    className: "repo rect item"
    events: {}

    initialize: ->


    render: ->
      @$el.html helper.get_template "repo", {model: @model.toJSON()}
      @checksize()
      @

    checksize: ()->
      $repo = @$el.find ".repoinfo"
      if $repo.text().length > 18
        $repo.addClass "smaller"

  module.exports = Repo
