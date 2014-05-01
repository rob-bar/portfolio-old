define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Project extends Backbone.Model
    defaults:
      name: "Unknown Name"
      client: "Unknown client"
      type_id: 0
      likes: 0
      created_at: new Date()
      description: "Unknown description"
      is_active: false
      media: {}
      tags: []

  module.exports = Project
