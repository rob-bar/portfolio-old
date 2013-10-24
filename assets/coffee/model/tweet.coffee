define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Tweet extends Backbone.Model
    defaults:
      id_str: 0
      text: "Unknown text"

  module.exports = Tweet
