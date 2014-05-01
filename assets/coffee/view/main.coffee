define [
  'module'
  'backbone'
  'helper'
  'site'
  'view/me'
  'view/projects'
  'view/projectdetail'
  'view/repos'
  'view/pics'
  'view/links'
  'view/tweets'
],
(module, Backbone, helper, site, MeView, ProjectsView, ProjectDetailView, ReposView, PicsView, LinksView, TweetsView) ->
  class Main extends Backbone.View
    tagName: "div"
    attributes:
      id: "main"

    events: {}

    init_events: ->
      site.vent.on 'showproject', @showproject

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
      @$wrapper = $ "<div/>", "class": "wrapper"
      @$wrapper.append @projects.render().$el
      @$el.append @$wrapper

      @repos = new ReposView()
      @$el.append @repos.render().$el

      @pics = new PicsView()
      @$el.append @pics.render().$el

      @links = new LinksView()
      @$el.append @links.render().$el

      @tweets = new TweetsView()
      @$el.append @tweets.render().$el

      @projectdetail = new ProjectDetailView()
      @$wrapper.append @projectdetail.$el

      @init_events()

    togglemenu: (e) ->
      e.preventDefault()
      $subnav = $ "#subnav"
      $subnav.toggleClass "open"

    togglesocial: (e) ->
      e.preventDefault()
      $subnav = $ "#subsocial"
      $subnav.toggleClass "open"

    showproject: (project) =>
      @projectdetail.render project

    scroll: (e) ->
      $subnav = $ "#subnav"
      $subsocial = $ "#subsocial"

      if $subnav.hasClass "open"
        $subnav.removeClass "open"

      if $subsocial.hasClass "open"
        $subsocial.removeClass "open"

  module.exports = Main
