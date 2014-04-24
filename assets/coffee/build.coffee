require.config
  deps: ['base']
  baseUrl: "/js/"
  paths:
    jquery: 'vendor/jquery'
    underscore: 'vendor/underscore'
    backbone: 'vendor/backbone'
    async: 'vendor/async'
    jade: 'vendor/jade'
  shim:
    underscore:
      exports: "_"
    templates:
      exports: "templates"
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    app:
      deps: ["backbone","masonry"],
      exports: "App"
