mongoose = require "mongoose"
project = null

exports.data =
  model: ->
    schema =
      title: { type: String, lowercase: true, trim: true }
      client: { type: String, lowercase: true, trim: true }
      type_id: mongoose.Schema.Types.ObjectId
      likes: { type: Number, min: 0, default: 0 }
      created_at: { type: Date, default: Date.now }
      kind: { type: String, default: "work" }
      description: String
      is_active: { type: Boolean, default: true }
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
    project.find {is_active: true}, null, {sort: {launch_date: 1}}, (err, docs) ->
      callback docs

  actives: (callback) ->
    @model()
    project.find {is_active: true}, (err, docs) -> callback docs
