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
    host: "api.twitter.com"
    method: "GET"
    headers:
      'Content-Type': 'application/json'

  all: (callback, req) ->
    h.help.oauthtoken (access_token) =>
      @options['user-agent']= req.get('user-agent')
      @options.path = "/1.1/statuses/user_timeline.json?include_entities=true&include_rts=1&screen_name=#{config.site.twitter.screenname}&count=200"
      @options.headers.Authorization = "Bearer #{access_token}"

      console.log @options
      h.help.securerequest @options, (data)->
        console.log data
        callback data

  tag: (callback, req) ->
    h.help.oauthtoken (access_token) =>
      @options['user-agent']= req.get('user-agent')
      @options.path = "/1.1/statuses/user_timeline.json?include_entities=true&include_rts=1&screen_name=#{config.site.twitter.screenname}&count=200"
      @options.headers.Authorization = "Bearer #{access_token}"

      h.help.securerequest @options, (data)->
        data = _.filter data, (tweet) ->
          for hashtag in tweet.entities.hashtags when hashtag.text is req.params.tag
            return true
          return false
        console.log data
        callback data