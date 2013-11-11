config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"

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
      # MAPPING
      _.each filtered, (repo, key, list) =>
        newrepo =
          "kind": "repo"
          "name": repo.name
          "url": repo.html_url
          "description": repo.description
          "created_at": repo.created_at
        list[key] = newrepo

      callback filtered
