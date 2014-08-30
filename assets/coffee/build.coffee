require.config
  deps: ['base', 'nav']
  baseUrl: "/js/"
  paths:
    jquery: 'vendor/jquery'
    underscore: 'vendor/underscore'
    backbone: 'vendor/backbone'
    async: 'vendor/async'
    jade: 'vendor/jade'
    appear: 'vendor/jquery.appear'
  shim:
    underscore:
      exports: "_"
    templates:
      exports: "templates"
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    appear:
      deps: ['jquery']
      exports: 'jQuery.fn.appear'
    app:
      deps: ["backbone"],
      exports: "App"
