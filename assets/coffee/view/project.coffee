define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Project extends Backbone.View
    tagName: "li"
    className: "work item"
    events: {}
    initialize: ->
    render: ->
      helper.get_template("project")(@model)

  module.exports = Project
