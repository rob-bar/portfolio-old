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
      helper.get_template("repo")(@model)

  module.exports = Repo
