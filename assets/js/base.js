(function() {
  $(function() {
    return _.each($(".repoinfo"), function(repo) {
      if ($(repo).text().length > 18) {
        return $(repo).addClass("smaller");
      }
    });
  });

}).call(this);

/*
//@ sourceMappingURL=base.js.map
*/