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
    host: "api.instagram.com"
    method: "GET"
    headers:
      "Content-Type": "application/json"

  all: (callback, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v1/users/#{config.site.instagram.ID}/media/recent/?access_token=#{config.site.instagram.token}&count=-1"
    h.help.securerequest @options, (data) -> callback data

  tag: (callback, tag, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v1/tags/#{tag}/media/recent/?access_token=#{config.site.instagram.token}&count=-1"
    h.help.securerequest @options, (data) -> callback data
