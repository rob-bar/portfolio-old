config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
moment = require "moment"

exports.data =
  options:
    host: "api.twitter.com"
    method: "GET"
    headers:
      "Content-Type": "application/json"

  all: (callback, req) ->
    h.help.oauthtoken (access_token) =>
      @options['user-agent']= req.get "user-agent"
      @options.path = "/1.1/statuses/user_timeline.json?include_entities=true&include_rts=1&screen_name=#{config.site.twitter.screenname}&count=200"
      @options.headers.Authorization = "Bearer #{access_token}"
      h.help.securerequest @options, (data) -> callback data

  tag: (callback, tag, req) ->
    h.help.oauthtoken (access_token) =>
      @options['user-agent']= req.get "user-agent"
      @options.path = "/1.1/statuses/user_timeline.json?include_entities=true&include_rts=1&screen_name=#{config.site.twitter.screenname}&count=200"
      @options.headers.Authorization = "Bearer #{access_token}"

      h.help.securerequest @options, (data) ->
        data = _.filter data, (tweet) ->
          for hashtag in tweet.entities.hashtags when hashtag.text is tag
            return true
          return false

        # MAPPING
        _.each data, (tweet, key, list) ->
          newtweet =
            "kind": "tweet"
            "id": tweet.id
            "name": tweet.name
            "description": tweet.text
            "tags": tweet.entities
            "created_at": moment tweet.created_at
          list[key] = newtweet

        callback data
