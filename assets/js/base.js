(function() {
  $(function() {
    _.each($(".repoinfo"), function(repo) {
      if ($(repo).text().length > 18) {
        return $(repo).addClass("smaller");
      }
    });
    return $(".work").mousemove(function(e) {
      var pos, relX, relY;
      pos = $(e.currentTarget).offset();
      relX = e.pageX - pos.left;
      return relY = e.pageY - pos.top;
    });
  });

}).call(this);

/*
//@ sourceMappingURL=base.js.map
*/