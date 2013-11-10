define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Item extends Backbone.Model
    defaults:
      name: "Unknown name"
      description: "Unknown description"

  module.exports = Item
