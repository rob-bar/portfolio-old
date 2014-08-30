define [
  'module'
  'backbone'
  'helper'
],
(module, Backbone, helper) ->
  class PicView extends Backbone.View
    tagName: "li"
    className: "pic rect item hide"
    events: {}

    initialize: (options)->
      @place = options.place

    render: ->
      @$el.html helper.get_template "pic", {model: @model.toJSON()}
      @

    in_viewport: () ->
      helper.in_view_port @el

    in_view_port_full: () ->
      helper.in_view_port_full @el
  module.exports = PicView
