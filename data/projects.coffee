mongoose = require "mongoose"
_ = require "underscore"
tags = require "./tags.coffee"
async = require "async"
project = null

exports.data =
  model: ->
    schema =
      title: { type: String, lowercase: true, trim: true }
      client: { type: String, lowercase: true, trim: true }
      type_id: mongoose.Schema.Types.ObjectId
      type: { type: String}
      likes: { type: Number, min: 0, default: 0 }
      created_at: { type: Date, default: Date.now }
      kind: { type: String, default: "work" }
      description: String
      is_active: { type: Boolean, default: true }
      tags: []
      media:
        thumb: String
        big: String
        pictures: Array
        videos: Array
        preview: String

    if project is null then project = mongoose.model "Projects", new mongoose.Schema schema

  all: (callback) ->
    @model()
    project.find {}, (err, docs) -> callback docs

  sorted: (callback) ->
    @model()
    project.find {is_active: true}, null, {sort: {created_at: -1}}, (err, docs) ->
      async.each docs, (doc, cb) ->
        tags.data.by_id doc.type_id, (tag) ->
          doc.type = tag.name

          if doc.tags.length > 0
            tags.data.by_ids doc.tags, (alltags)->
              doc.tags = alltags
              do cb
          else
            do cb
      , (err)->
        callback docs


  actives: (callback) ->
    @model()
    project.find {is_active: true}, (err, docs) -> callback docs
