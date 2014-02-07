mongoose = require "mongoose"
config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
moment = require "moment"
link = null

realdates =
    "Backbone infinite scroll": "2013-10-23"
    "Fetching Backbone Submodels": "2013-10-23"
    "Node Version Manager (NVM)": "2013-10-14"
    "CoffeeScript in Node.js": "2013-10-14"
    "Easing Functions": "2013-9-20"
    "PageSpeed Insights": "2013-7-26"
    "git - fast-forward": "2013-7-24"
    "10 CoffeeScript One Liners": "2013-7-22"
    "Icon Hover Effects": "2013-6-14"
    "Page Transitions": "2013-6-14"
    "Speaker Deck": "2013-5-19"
    "Detecting Retina display": "2013-4-19"
    "Handlebars demo": "2013-3-28"
    "Pete Design": "2013-3-19"
    "Zone Franche": "2013-3-19"
    "Holobox": "2013-3-19"
    "Minimal Monkey": "2013-3-19"
    "Expanding Overlay Effect": "2013-3-19"
    "Flipping Circle Slideshow": "2013-3-19"
    "Move The Web Forward": "2012-10-5"
    "jQuery Waypoints": "2012-10-5"
    "jQuery Scroll Path": "2012-10-5"
    "Codrops": "2012-10-5"
    "jQuery File Upload": "2012-9-13"
    "Hammer.js": "2012-8-20"
    "JS Bin": "2012-8-20"
    "CodePen": "2012-8-20"
    "Backbone.js": "2012-2-6"
    "HTML5 Semantics": "2011-11-29"
    "HTML5 Doctor": "2011-11-29"
    "Three.js": "2011-11-29"
    "CanvasLoader": "2011-11-29"
    "oCanvas": "2011-11-29"

exports.data =
  model: ->
    schema =
      kind: { type: String, default: "link" }
      name: { type: String, lowercase: true, trim: true }
      description: String
      url: { type: String, default: "none" }
      tags: mongoose.Schema.Types.Mixed
      is_active: { type: Boolean, default: true }
      created_at: { type: Date, default: Date.now }

    if link is null then link = mongoose.model "Links", new mongoose.Schema schema

  all: (callback) ->
    @model()
    link.find {}, (err, docs) -> callback docs

  drop: () ->
    @model()
    if link.collection?
      link.collection.drop()

  save: (delilink) ->
    @model()
    delilink = new link delilink
    delilink.save()

  load: (callback, tag, req) ->
    options =
      host: "feeds.delicious.com"
      method: "GET"
      headers:
        "Content-Type": "application/json"

    options['user-agent'] = req.get "user-agent"
    options.path = "/v2/json/#{config.site.deli.username}/#{tag}?count=100"

    h.help.request options, (data) =>
      @drop()

      # # MAPPING
      _.each data, (link, key, list) =>

        if _.contains _.keys(realdates), link.d
          ca = moment(realdates[link.d], "YYYY-MM-DD Z").toDate()
        else
          ca = moment.utc(link.dt, "YYYY-MM-DD Z").toDate()

        newlink =
          "kind": "link"
          "name": link.d
          "description": link.n
          "url": link.u
          "tags": link.t
          "created_at": ca

        @save newlink
        list[key] = newlink

      callback data
