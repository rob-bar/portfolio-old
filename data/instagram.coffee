mongoose = require "mongoose"
config = require "../config/config.coffee"
h = require "../config/helper.coffee"
_ = require "underscore"
moment = require "moment"
pic = null

exports.data =
  model: ->
    schema =
      kind: { type: String, default: "pic" }
      name: { type: String, lowercase: true, trim: true }
      description: String
      images: mongoose.Schema.Types.Mixed
      url: { type: String, default: "none" }
      is_active: { type: Boolean, default: true }
      created_at: { type: Date, default: Date.now }

    if pic is null then pic = mongoose.model "Pics", new mongoose.Schema schema

  all: (callback) ->
    @model()
    pic.find {}, (err, docs) -> callback docs

  save: (picture) ->
    @model()
    picture = new pic picture
    picture.save (err) ->
      console.log "OK"

  drop: () ->
    @model()
    if pic.collection?
      pic.collection.drop()

  tag: (callback, tag, req) ->
    options =
      host: "api.instagram.com"
      method: "GET"
      headers:
        "Content-Type": "application/json"

    options['user-agent'] = req.get "user-agent"
    options.path = "/v1/users/#{config.site.instagram.ID}/media/recent/?access_token=#{config.site.instagram.token}&count=-1"

    h.help.securerequest options, (data) =>
      data = _.filter data.data, (pic) ->
        if pic.comments.data?
          for comment in pic.comments.data when comment.text is "##{tag}"
            return true
        if pic.tags?
          for mytag in pic.tags when mytag is tag
            return true
        return false

      @drop()
      # maping
      _.each data, (pic, key, list) =>
        newpic =
          "kind": "pic"
          "name": "Robbie Bardijn"
          "description": if pic.caption? then pic.caption.text else ""
          "images": pic.images
          "url": pic.link
          "created_at": moment.unix pic.created_time
        @save newpic
        list[key] = newpic

      callback data

