module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  # Project configuration.
  grunt.initConfig
    vendorlibs:['assets/js/vendor/*.js', 'assets/js/base.js']
    compass:
      app:
        options:
          require: ['compass-h5bp','ceaser-easing']
          sassDir: 'assets/sass'
          cssDir: 'assets/css'
          imagesDir: 'assets/img'
          fontsDir: 'assets/font'
          httpPath: '/'
          relativeAssets: true
          debugInfo: false
          outputStyle: 'expanded'
          noLineComments: true
          raw: 'preferred_syntax = :sass\n'

    coffee:
      app:
        files: [
          expand: true
          preserve_dirs: true
          bare: false
          cwd: 'assets/coffee'
          src: ['**/*.coffee']
          dest: 'assets/js'
          ext: '.js'
        ]

    requirejs:
      compile:
        options:
          mainConfigFile: '/assets/js/build.js'
          baseUrl: "/assets/js"
          name: "base"
          include: ['templates', 'build']
          insertRequire: ['templates']
          out: 'assets/js/base.min.js'
          preserveLicenseComments: false

    jshint:
      app:
        options:
          boss: true
          expr: true
          eqnull: true
          browser: true
        files:
          src: 'assets/js/base.min.js'

    imagemin:
      dist:
        options:
          optimizationLevel: 3
        files: [
            expand: true,
            cwd: "assets/img/"
            src: "**/*.{png,jpg,jpeg}"
            dest: "assets/img/"
        ]

    jade:
      compile:
        options:
          compileDebug: false
          client: true
          amd: true
        files:
          "assets/templates/templates.js": ["assets/templates/*.jade"]


    watch:
      options:
        atBegin: true
        interrupt: false
        spawn: false
      app:
        files: ['assets/coffee/**/*.coffee']
        tasks: ['coffee']
      sass:
        files: ['assets/sass/**/*.sass']
        tasks: ['compass']
      jade:
        files: ['assets/templates/**/*.jade']
        tasks: ['jade']

  # Default task.
  grunt.registerTask 'default', [
    'compass'
    'coffee'
    'jade'
  ]

  # deploy
  grunt.registerTask 'deploy', [
    'compass'
    'coffee'
    'jshint'
    'jade'
    'imagemin'
    'requirejs'
  ]
