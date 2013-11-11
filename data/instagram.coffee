config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
moment = require "moment"

exports.data =
  options:
    host: "api.instagram.com"
    method: "GET"
    headers:
      "Content-Type": "application/json"

  all: (callback, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v1/users/#{config.site.instagram.ID}/media/recent/?access_token=#{config.site.instagram.token}&count=-1"
    h.help.securerequest @options, (data) -> callback data.data

  tag: (callback, tag, req) ->
    @options['user-agent'] = req.get "user-agent"
    @options.path = "/v1/users/#{config.site.instagram.ID}/media/recent/?access_token=#{config.site.instagram.token}&count=-1"

    h.help.securerequest @options, (data) ->

      data = _.filter data.data, (pic) ->
        if pic.comments.data?
          for comment in pic.comments.data when comment.text is "##{tag}"
            return true
        if pic.tags?
          for mytag in pic.tags when mytag is tag
            return true
        return false

      # maping
      _.each data, (pic, key, list) ->
        moment.unix pic.created_time
        newpic =
          "kind": "pic"
          "name": "Robbie Bardijn"
          "description": if pic.caption? then pic.caption.text else ""
          "images": pic.images
          "url": pic.link
          "created_at": moment.unix pic.created_time
        list[key] = newpic

      callback data

