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
moment = require "moment"

mongoose.connect "mongodb://localhost/portfolio"
cnt = 0
all = undefined

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

# LOADS FOR CRON
exports.load =
  tweets: (req, res) ->
    twitter.data.load (data) ->
      res.json data
    , config.site.tag, req

  pics: (req, res) ->
    instagram.data.load (data) ->
      res.json data
    , config.site.tag, req

  repos: (req, res) ->
    github.data.load (data) ->
      res.json data
    , req

  links: (req, res) ->
    delicious.data.load (data) ->
      res.json data
    , config.site.tag, req

# REST API
exports.rest =
  grav: (req, res) ->
    crypto = require "crypto"
    md5 = crypto.createHash "md5"
    url = md5.update(config.site.grav.email).digest "hex"
    url = config.site.grav.url.replace /hash/, url
    res.json url

  all: (req, res) ->
    offset = req.param "offset"
    limit = req.param "limit"

    async.series
      works: (callback) ->
        projects.data.actives (works) ->
          callback(null, works)

      repos: (callback) ->
        github.data.all (repos) ->
          callback(null, repos)

      pics: (callback) ->
        instagram.data.all (pics) ->
          callback(null, pics)

      tweets: (callback) ->
        twitter.data.all (tweets) ->
          callback(null, tweets)

      links: (callback) ->
        delicious.data.all (links) ->
          callback(null, links)

      (err, results) ->
        results = _.union results.works, results.repos, results.pics, results.links
        results = _.sortBy results, (result) -> moment(result.created_at).valueOf()
        results = _.sortBy results, (result) -> result.kind
        results = results.reverse()

        # PAGINATED OR NOT
        if offset? and limit?
          results = results.slice offset, parseInt(offset, 10) + parseInt(limit, 10)

        res.json results

  works: (req, res) ->
    projects.data.actives (works) ->
      res.json works

  socials: (req, res) ->
    socials.data.actives (socials) ->
      res.json socials

  navs: (req, res) ->
    navs.data.actives (navs) ->
      res.json navs

  repos: (req, res) ->
    github.data.all (data) ->
      res.json data

  links: (req, res) ->
    delicious.data.all (data) ->
      res.json data

  tweets: (req, res) ->
    twitter.data.all (data) ->
      res.json data

  pics: (req, res) ->
    instagram.data.all (data) ->
      res.json data
