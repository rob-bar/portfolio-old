define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Repo extends Backbone.Model
    defaults:
      name: "Unknown name"
      url: "http://404.com"

  module.exports = Repo
