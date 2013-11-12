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
      @

  module.exports = Repo
