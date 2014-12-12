(function() {
  define(['module', 'jquery', 'backbone', '../templates/templates'], function(module, $, Backbone) {
    var helper;
    helper = {
      intro_done: false,
      get_template: function(name, data) {
        return JST["assets/templates/" + name](data);
      },
      track_page: function() {
        var frag, _gaq;
        _gaq = window._gaq || [];
        frag = Backbone.history.getFragment();
        return _gaq.push(['_trackPageview', "/" + frag]);
      },
      project_colls: function() {
        return $("#main").width() / 320;
      },
      animation_factor: function() {
        return this.project_colls() * 25;
      },
      animation_delay: function(index) {
        return ((index * 100) / this.animation_factor()) * 100;
      },
      zero_fill: function(i) {
        var ret;
        ret = i < 10 ? '0' : '';
        return ret + i;
      },
      in_view_port: function(el) {
        var rect;
        rect = el.getBoundingClientRect();
        return rect.top >= 0 && rect.left >= 0 && (rect.top + ((rect.bottom - rect.top) * .25)) <= (window.innerHeight || document.documentElement.clientHeight) && rect.right <= (window.innerWidth || document.documentElement.clientWidth);
      },
      in_view_port_full: function(el) {
        var rect;
        rect = el.getBoundingClientRect();
        return rect.top >= 0 && rect.left >= 0 && rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && rect.right <= (window.innerWidth || document.documentElement.clientWidth);
      },
      scroll_to: function(target) {
        var destination, speed, topoffset;
        if ($(target).offset() != null) {
          topoffset = 55;
          speed = 600;
          destination = $(target).offset().top - topoffset;
          $('html:not(:animated),body:not(:animated)').animate({
            scrollTop: destination
          }, speed, function() {
            return $(document).scrollTop(destination);
          });
        }
        return false;
      },
      set_height: function(collection, el, colls) {
        return _.debounce(function() {
          var height;
          height = Math.ceil(collection.length / colls) * 160;
          return el.css("height", "" + height + "px");
        }, 300);
      }
    };
    return module.exports = helper;
  });

}).call(this);
