(function() {
  $(function() {
    var site;
    site = {
      mousesover: true
    };
    _.each($(".repoinfo"), function(repo) {
      if ($(repo).text().length > 18) {
        return $(repo).addClass("smaller");
      }
    });
    return $('.likes').click(function(e) {
      e.preventDefault();
      console.log("clicked");
      return $(e.currentTarget).addClass("liked");
    });
  });

}).call(this);

/*
//@ sourceMappingURL=base.js.map
*/