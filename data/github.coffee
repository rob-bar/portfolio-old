mongoose = require "mongoose"
config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
repo = null

exports.data =
  model: ->
    schema =
      kind: { type: String, default: "repo" }
      name: { type: String, lowercase: true, trim: true }
      description: String
      url: { type: String, default: "none" }
      is_active: { type: Boolean, default: true }
      created_at: { type: Date, default: Date.now }

    if repo is null then repo = mongoose.model "Repos", new mongoose.Schema schema

  all: (callback) ->
    @model()
    repo.find {}, (err, docs) -> callback docs

  drop: () ->
    @model()
    if repo.collection?
      repo.collection.drop()

  save: (repository) ->
    @model()
    repository = new repo repository
    repository.save()

  load: (callback, req) ->
    options =
      host: "api.github.com"
      method: "GET"
      headers:
        "Content-Type": "application/json"

    options['user-agent'] = req.get "user-agent"
    options.path = "/users/#{config.site.github.username}/repos?sort=created&type=owner&client_id=#{config.site.github.id}&client_secret=#{config.site.github.secret}"

    h.help.securerequest options, (data) =>
      filtered = _.filter data, (repo) -> !repo.fork

      @drop()
      # MAPPING
      _.each filtered, (repo, key, list) =>
        newrepo =
          "kind": "repo"
          "name": repo.name
          "description": repo.description
          "url": repo.html_url
          "created_at": repo.created_at
        @save newrepo
        list[key] = newrepo

      callback filtered
