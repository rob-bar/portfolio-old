config = require('../config/config.coffee')
h = require('../config/helper.coffee')
_ = require('underscore')

_.pluckMany = (obj, keys) ->
  return _.map obj, (value) ->
    mapped = {}
    _.each keys, (key, index, list)->
      mapped[key] = value[key]
    return mapped

exports.data =
  options:
    host: "feeds.delicious.com"
    method: "GET"
    headers:
      'Content-Type': 'application/json'

  all: (callback, req) ->
    @options['user-agent'] = req.get('user-agent')
    @options.path = "/v2/json/#{config.site.deli.username}?count=100"
    h.help.request @options, (data)->
      callback data

  tag: (callback, req) ->
    @options['user-agent'] = req.get('user-agent')
    @options.path = "/v2/json/#{config.site.deli.username}/#{req.params.tag}?count=100"

    h.help.request @options, (data)->
      callback data