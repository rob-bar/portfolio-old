(function() {
  require.config({
    deps: ['base', 'nav'],
    baseUrl: "/js/",
    paths: {
      jquery: 'vendor/jquery',
      underscore: 'vendor/underscore',
      backbone: 'vendor/backbone',
      backbonenested: 'vendor/backbonenested',
      async: 'vendor/async',
      jade: 'vendor/jade',
      appear: 'vendor/jquery.appear'
    },
    shim: {
      underscore: {
        exports: "_"
      },
      templates: {
        exports: "templates"
      },
      backbone: {
        deps: ['underscore', 'jquery'],
        exports: 'Backbone'
      },
      backbonenested: {
        deps: ['backbone'],
        exports: 'Backbonenested'
      },
      appear: {
        deps: ['jquery'],
        exports: 'jQuery.fn.appear'
      },
      app: {
        deps: ["backbone"],
        exports: "App"
      }
    }
  });

}).call(this);
