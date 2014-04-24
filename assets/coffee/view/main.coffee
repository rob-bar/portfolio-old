define [
  'module'
  'backbone'
  'helper'
  'view/me'
  'site'
  'collection/all'
  'view/pic'
  'view/link'
  'view/project'
  'view/tweet'
  'view/repo'
  'masonry'
],
(module, Backbone, helper, MeView, site, All, Pic, Link, Project, Tweet, Repo, Masonry) ->
  class Main extends Backbone.View
    tagName: "ul"
    attributes:
      id: "all"

    events:
      "click li": "toggle"

    init_events: ->
      site.vent.on 'grav', @grav

      @nav.find('ul#nav li.menu').on "click", @togglemenu
      $('#subnav').on "mouseleave", @togglemenu

      @nav.find('ul#social li.menu').on "click", @togglesocial
      $('#subsocial').on "mouseleave", @togglesocial

      $(window).on "scroll", @scroll

    initialize: ->
      @nav = $ "header nav"
      @me = new MeView()
      @col = new All()

      @init_events()
      @me.render()

      @col.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = switch model.get 'kind'
              when 'link' then new Link model: model
              when 'pic' then new Pic model: model
              when 'repo' then new Repo model: model
              when 'work' then new Project model: model
              when 'tweet' then new Tweet model: model
            @$el.append view.render().$el

    grav: =>
      @$el.append @me.$el


    togglemenu: (e) ->
      e.preventDefault()
      $subnav = $ "#subnav"
      $subnav.toggleClass "open"

    togglesocial: (e) ->
      e.preventDefault()
      $subnav = $ "#subsocial"
      $subnav.toggleClass "open"

    toggle: (e) ->
      e.preventDefault()
      unless $('li').eq(0).hasClass "inback"
        $('li, div').each () ->
          setTimeout =>
            $(@).addClass "inback"
          , $(@).offset().top * 0.75

      else
        $('li, div').each () ->
          setTimeout =>
            $(@).removeClass "inback"
          , $(@).offset().top * 0.75

    scroll: (e) ->
      $subnav = $ "#subnav"
      $subsocial = $ "#subsocial"

      if $subnav.hasClass "open"
        $subnav.removeClass "open"

      if $subsocial.hasClass "open"
        $subsocial.removeClass "open"

  module.exports = Main
