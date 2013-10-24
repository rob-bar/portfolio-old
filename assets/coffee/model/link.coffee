define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Link extends Backbone.Model
    defaults:
      name: "Unknown name"
      description: "Unknown description"
      url: "http://404.com"
      tags: []

  module.exports = Link
