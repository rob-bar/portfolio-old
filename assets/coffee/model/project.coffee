define [
  'module'
  'backbone'
  'helper'
  # 'backbonenested'
],
(module, Backbone, helper) ->
  class Project extends Backbone.Model
    relations:
      "media": Backbone.Model

    defaults:
      _id: 0
      name: "Unknown Name"
      client: "Unknown client"
      type_id: 0
      likes: 0
      created_at: new Date()
      description: "Unknown description"
      is_active: false
      media:
        thumb: ""
        big: ""
        pictures: []
        videos: []
        preview: ""
      tags: []
      month: -> helper.zero_fill(new Date(@created_at).getMonth() + 1)
      year: -> new Date(@created_at).getFullYear()

    slug: ->
      @get("name")
        .toLowerCase()
        .replace(/\s/g, "-")
        .replace(/[^\w-]+/g, "")



  module.exports = Project
