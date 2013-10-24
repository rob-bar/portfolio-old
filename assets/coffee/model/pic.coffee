define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class Pic extends Backbone.Model
    defaults:
      title: "Unknown title"
      url: "http://404.com"
      image_small: "http://404.com"
      image_large: "http://404.com"

  module.exports = Pic
