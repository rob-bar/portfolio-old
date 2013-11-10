async = require "async"
mongoose = require "mongoose"
config = require "../config/config.coffee"
socials = require "../data/socials.coffee"
navs = require "../data/navs.coffee"
projects = require "../data/projects.coffee"
github = require "../data/github.coffee"
delicious = require "../data/delicious.coffee"
twitter = require "../data/twitter.coffee"
instagram = require "../data/instagram.coffee"
analytics = require "../data/analytics.coffee"
_ = require "underscore"

mongoose.connect "mongodb://localhost/portfolio"
cnt = 0
exports.other =
  index: (req, res) ->
    async.series
      socials: (callback) ->
        socials.data.actives (docs) ->
          callback(null, docs)

      navs: (callback) ->
        navs.data.actives (docs) ->
          callback(null, docs)

      (err, results) ->
        results.title = "My portfolio"

        # NOT ON ITS PLACE HERE
        if config.site.mode is "production"
          results.ga = config.site.ga
        else
          results.ga = config.site.fake_ga

        res.render "pages/index", results
    @

  cv: (req, res, next) ->
    res.header "Accept-Ranges", "none"
    analytics.data.add_cv_link_click (str) ->
      next()

exports.rest =
  grav: (req, res) ->
    crypto = require "crypto"
    md5 = crypto.createHash "md5"
    url = md5.update(config.site.grav.email).digest "hex"
    url = config.site.grav.url.replace /hash/, url
    res.json url
    res.end()

  all: (req, res) ->
    async.series
      works: (callback) ->
        projects.data.actives (works) ->
          callback(null, works)
        , req

      repos: (callback) ->
        github.data.all (repos) ->
          callback(null, repos)
        , req

      pics: (callback) ->
        instagram.data.tag (pics) ->
          callback(null, pics)
        , config.site.tag, req

      tweets: (callback) ->
        twitter.data.tag (tweets) ->
          callback(null, tweets)
        , config.site.tag, req

      links: (callback) ->
        instagram.data.tag (links) ->
          callback(null, links)
        , config.site.tag, req

      (err, results) ->
        results = _.union results.works, results.repos, results.pics, results.tweets, results.links
        res.json results
        res.end()

  works: (req, res) ->
    projects.data.actives (works) ->
      res.json works
      res.end()

  socials: (req, res) ->
    socials.data.actives (socials) ->
      res.json socials
      res.end()

  navs: (req, res) ->
    navs.data.actives (navs) ->
      res.json navs
      res.end()

  repos: (req, res) ->
    github.data.all (data) ->
      res.json data
      res.end()
    , req

  links: (req, res) ->
    delicious.data.tag (data) ->
      res.json data
      res.end()
    , config.site.deli.hashtag, req

  tweets: (req, res) ->
    twitter.data.all (data) ->
      res.json data
      res.end()
    ,req

  pics: (req, res) ->
    instagram.data.all (data) ->
      res.json data
      res.end()
    ,req

  # BYTAG
  tagged:
    links: (req, tag, res) ->
      delicious.data.tag (data) ->
        res.json data
        res.end()
      , tag, req

    tweets: (req, tag, res) ->
      twitter.data.tag (data) ->
        res.json data
        res.end()
      , tag, req

    pics: (req, tag, res) ->
      instagram.data.tag (data) ->
        res.json data
        res.end()
      , tag, req
