(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper', 'view/me', 'site', 'collection/all', 'view/pic', 'view/link', 'view/project', 'view/tweet', 'view/repo', 'masonry'], function(module, Backbone, helper, MeView, site, All, Pic, Link, Project, Tweet, Repo, Masonry) {
    var Main, _ref;
    Main = (function(_super) {
      __extends(Main, _super);

      function Main() {
        this.grav = __bind(this.grav, this);
        _ref = Main.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Main.prototype.tagName = "ul";

      Main.prototype.attributes = {
        id: "all"
      };

      Main.prototype.events = {
        "click li": "toggle"
      };

      Main.prototype.init_events = function() {
        site.vent.on('grav', this.grav);
        this.nav.find('ul#nav li.menu').on("click", this.togglemenu);
        $('#subnav').on("mouseleave", this.togglemenu);
        this.nav.find('ul#social li.menu').on("click", this.togglesocial);
        $('#subsocial').on("mouseleave", this.togglesocial);
        return $(window).on("scroll", this.scroll);
      };

      Main.prototype.initialize = function() {
        var _this = this;
        this.nav = $("header nav");
        this.me = new MeView();
        this.col = new All();
        this.init_events();
        this.me.render();
        return this.col.fetch({
          success: function(results) {
            return results.each(function(model, index, list) {
              var view;
              view = (function() {
                switch (model.get('kind')) {
                  case 'link':
                    return new Link({
                      model: model
                    });
                  case 'pic':
                    return new Pic({
                      model: model
                    });
                  case 'repo':
                    return new Repo({
                      model: model
                    });
                  case 'work':
                    return new Project({
                      model: model
                    });
                  case 'tweet':
                    return new Tweet({
                      model: model
                    });
                }
              })();
              return _this.$el.append(view.render().$el);
            });
          }
        });
      };

      Main.prototype.grav = function() {
        return this.$el.append(this.me.$el);
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

      Main.prototype.toggle = function(e) {
        e.preventDefault();
        if (!$('li').eq(0).hasClass("inback")) {
          return $('li, div').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).addClass("inback");
            }, $(this).offset().top * 0.75);
          });
        } else {
          return $('li, div').each(function() {
            var _this = this;
            return setTimeout(function() {
              return $(_this).removeClass("inback");
            }, $(this).offset().top * 0.75);
          });
        }
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
