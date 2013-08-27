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
    host: "api.github.com"
    method: "GET"
    headers:
      "Content-Type": "application/json"

  all: (callback, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/users/#{config.site.github.username}/repos?sort=created&type=owner&client_id=#{config.site.github.id}&client_secret=#{config.site.github.secret}"
    h.help.securerequest @options, (data) ->
      filtered = _.filter data, (repo) -> !repo.fork
      picked = _.pluckMany(filtered, ['name', 'html_url', 'description', 'created_at'])
      callback picked
