config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"

_.pluckMany = (obj, keys) ->
  return _.map obj, (value) ->
    mapped = {}
    _.each keys, (key, index, list) ->
      mapped[key] = value[key]
    return mapped

exports.data =
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
    h.help.request @options, (data) ->

      picked = _.pluckMany(filtered, ['d', 'u', 't', 'dt'])
      map = ["title", "url", "tags", "created_at"]
      _.each picked, (value, key, list) ->
        list[key] = _.object(map,_.values value)
      console.log picked
      callback picked
