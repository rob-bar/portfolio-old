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
          _.extend tweet, {"name": "Robbie Bardijn"}
          for hashtag in tweet.entities.hashtags when hashtag.text is tag
            return true
          return false

        picked = _.pluckMany(data, ['id', 'name', 'text', 'entities', 'created_at'])
        map = ["id", "name", "description", "tags", "created_at"]
        _.each picked, (value, key, list) ->
          list[key] = _.object(map,_.values value)


        callback picked
