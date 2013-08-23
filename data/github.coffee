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
    host: 'api.github.com'
    path: "/users/#{config.site.github.username}/repos?sort=created&type=owner"
    method: "GET"
    headers:
      'Content-Type': 'application/json'


  all: (callback, req)->
    @options['user-agent']= req.get('user-agent')
    h.help.securerequest @options, (data) ->
      filtered = _.filter data, (repo) -> !repo.fork
      picked = _.pluckMany(filtered, ['full_name', 'html_url', 'description', 'created_at'])
      callback picked