define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class RepoView extends Backbone.View
    tagName: "li"
    className: "repo rect item hide"
    events: {}

    initialize: (options)->
      @place = options.place

    render: ->
      @$el.html helper.get_template "repo", {model: @model.toJSON()}
      @checksize()
      @

    checksize: ()->
      $repo = @$el.find ".repoinfo"
      if $repo.text().length > 18
        $repo.addClass "smaller"

    in_viewport: () ->
      helper.in_view_port @el

    in_view_port_full: () ->
      helper.in_view_port_full @el

  module.exports = RepoView
