mongoose = require "mongoose"
config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
moment = require "moment"
tweet = null

exports.data =
  model: ->
    schema =
      id: Number
      kind: { type: String, default: "tweet" }
      name: { type: String, lowercase: true, trim: true }
      description: String
      tags: mongoose.Schema.Types.Mixed
      is_active: { type: Boolean, default: true }
      created_at: { type: Date, default: Date.now }

    if tweet is null then tweet = mongoose.model "Tweets", new mongoose.Schema schema

  all: (callback) ->
    @model()
    tweet.find {}, (err, docs) -> callback docs

  drop: () ->
    @model()
    if tweet.collection?
      tweet.collection.drop()

  save: (newtweet) ->
    @model()
    newtweet = new tweet newtweet
    newtweet.save()

  load: (callback, tag, req) ->
    options =
      host: "api.twitter.com"
      method: "GET"
      headers:
        "Content-Type": "application/json"

    h.help.oauthtoken (access_token) =>
      options['user-agent']= req.get "user-agent"
      options.path = "/1.1/statuses/user_timeline.json?include_entities=true&include_rts=1&screen_name=#{config.site.twitter.screenname}&count=200"
      options.headers.Authorization = "Bearer #{access_token}"

      h.help.securerequest options, (data) =>

        data = _.filter data, (tweet) ->
          for hashtag in tweet.entities.hashtags when hashtag.text is tag
            return true
          return false

        @drop()
        # MAPPING
        _.each data, (tweet, key, list) =>
          newtweet =
            "id": tweet.id
            "kind": "tweet"
            "name": tweet.name
            "description": tweet.text
            "tags": tweet.entities
            "created_at": moment tweet.created_at
          list[key] = newtweet
          @save newtweet

        callback data
