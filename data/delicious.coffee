config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"

exports.data =
  realdates:
    "Backbone infinite scroll": "23-10-2013"
    "Fetching Backbone Submodels": "23-10-2013"
    "Node Version Manager (NVM)": "14-10-2013"
    "CoffeeScript in Node.js": "14-10-2013"
    "Easing Functions": "20-9-2013"
    "PageSpeed Insights": "26-7-2013"
    "git - fast-forward": "24-7-2013"
    "10 CoffeeScript One Liners": "22-7-2013"
    "Icon Hover Effects": "14-6-2013"
    "Page Transitions": "14-6-2013"
    "Speaker Deck": "19-5-2013"
    "Detecting Retina display": "19-4-2013"
    "Handlebars demo": "28-3-2013"
    "Pete Design": "19-3-2013"
    "Zone Franche": "19-3-2013"
    "Holobox": "19-3-2013"
    "Minimal Monkey": "19-3-2013"
    "Expanding Overlay Effect": "19-3-2013"
    "Flipping Circle Slideshow": "19-3-2013"
    "Move The Web Forward": "5-10-2012"
    "jQuery Waypoints": "5-10-2012"
    "jQuery Scroll Path": "5-10-2012"
    "Codrops": "5-10-2012"
    "jQuery File Upload": "13-9-2012"
    "Hammer.js": "20-8-2012"
    "JS Bin": "20-8-2012"
    "CodePen": "20-8-2012"
    "Backbone.js": "6-2-2012"
    "HTML5 Semantics": "29-11-2011"
    "HTML5 Doctor": "29-11-2011"
    "Three.js": "29-11-2011"
    "CanvasLoader": "29-11-2011"
    "oCanvas": "29-11-2011"

  options:
    host: "feeds.delicious.com"
    method: "GET"
    headers:
      "Content-Type": "application/json"

  all: (callback, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v2/json/#{config.site.deli.username}?count=100"
    h.help.request @options, (data) -> callback data

  tag: (callback, tag, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v2/json/#{config.site.deli.username}/#{tag}?count=100"
    realdates = @realdates
    h.help.request @options, (data) ->

      # MAPPING
      _.each data, (link, key, list) =>
        newlink =
          "kind": "link"
          "name": link.d
          "url": link.u
          "description": link.n
          "tags": link.t
          "created_at": if _.contains _.keys(realdates), link.d then moment(realdates[link.d], "DD-MM-YYYY") else link.d
        list[key] = newlink

      callback data
