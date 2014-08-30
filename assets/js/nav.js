(function() {
  define(['site'], function(site) {
    return $(function() {
      return $('#nav .scroll').click(function(e) {
        var frag;
        e.preventDefault();
        frag = $(e.currentTarget).attr("href");
        return site.router.navigate(frag, {
          trigger: true
        });
      });
    });
  });

}).call(this);
