(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'site', 'view/me', 'view/projects', 'view/repos', 'view/pics', 'view/links', 'view/tweets'], function(module, Backbone, helper, site, MeView, ProjectsView, ReposView, PicsView, LinksView, TweetsView) {
    var Main, _ref;
    Main = (function(_super) {
      __extends(Main, _super);

      function Main() {
        _ref = Main.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Main.prototype.tagName = "div";

      Main.prototype.attributes = {
        id: "main"
      };

      Main.prototype.events = {};

      Main.prototype.init_events = function() {
        site.vent.on('grav', this.grav);
        this.nav.find('ul#nav li.menu').on("click", this.togglemenu);
        $('#subnav').on("mouseleave", this.togglemenu);
        this.nav.find('ul#social li.menu').on("click", this.togglesocial);
        $('#subsocial').on("mouseleave", this.togglesocial);
        return $(window).on("scroll", this.scroll);
      };

      Main.prototype.initialize = function() {
        this.nav = $("header nav");
        this.me = new MeView();
        this.$el.append(this.me.render().$el);
        this.projects = new ProjectsView();
        this.$el.append(this.projects.render().$el);
        this.repos = new ReposView();
        this.$el.append(this.repos.render().$el);
        this.pics = new PicsView();
        this.$el.append(this.pics.render().$el);
        this.links = new LinksView();
        this.$el.append(this.links.render().$el);
        this.tweets = new TweetsView();
        this.$el.append(this.tweets.render().$el);
        return this.init_events();
      };

      Main.prototype.togglemenu = function(e) {
        var $subnav;
        e.preventDefault();
        $subnav = $("#subnav");
        return $subnav.toggleClass("open");
      };

      Main.prototype.togglesocial = function(e) {
        var $subnav;
        e.preventDefault();
        $subnav = $("#subsocial");
        return $subnav.toggleClass("open");
      };

      Main.prototype.scroll = function(e) {
        var $subnav, $subsocial;
        $subnav = $("#subnav");
        $subsocial = $("#subsocial");
        if ($subnav.hasClass("open")) {
          $subnav.removeClass("open");
        }
        if ($subsocial.hasClass("open")) {
          return $subsocial.removeClass("open");
        }
      };

      return Main;

    })(Backbone.View);
    return module.exports = Main;
  });

}).call(this);
