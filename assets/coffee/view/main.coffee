define [
  'module'
  'backbone'
  'helper'
  'site'
  'view/me'
  'view/projects'
  'view/repos'
  'view/pics'
  'view/links'
  'view/tweets'
],
(module, Backbone, helper, site, MeView, ProjectsView, ReposView, PicsView, LinksView, TweetsView) ->
  class Main extends Backbone.View
    tagName: "div"
    attributes:
      id: "main"

    events: {}

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
      @$el.append @me.render().$el

      @projects = new ProjectsView()
      @$el.append @projects.render().$el

      @repos = new ReposView()
      @$el.append @repos.render().$el

      @pics = new PicsView()
      @$el.append @pics.render().$el

      @links = new LinksView()
      @$el.append @links.render().$el

      @tweets = new TweetsView()
      @$el.append @tweets.render().$el

      @init_events()


    togglemenu: (e) ->
      e.preventDefault()
      $subnav = $ "#subnav"
      $subnav.toggleClass "open"

    togglesocial: (e) ->
      e.preventDefault()
      $subnav = $ "#subsocial"
      $subnav.toggleClass "open"


    scroll: (e) ->
      $subnav = $ "#subnav"
      $subsocial = $ "#subsocial"

      if $subnav.hasClass "open"
        $subnav.removeClass "open"

      if $subsocial.hasClass "open"
        $subsocial.removeClass "open"

  module.exports = Main
