define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Project extends Backbone.Model
    defaults:
      title: "Unknown title"
      client: "Unknown client"
      type_id: 0
      likes: 0
      launch_date: new date()
      description: "Unknown description"
      is_active: false
      media: {}
      tags: []

  module.exports = Project
