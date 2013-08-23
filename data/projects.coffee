mongoose = require 'mongoose'
project = null

exports.data =
  model: ->
    schema =
      title: { type: String, lowercase: true, trim: true }
      client: { type: String, lowercase: true, trim: true }
      type_id: mongoose.Schema.Types.ObjectId
      likes: { type: Number, min: 0, default: 0 }
      launch_date: { type: Date, default: Date.now }
      description: String
      is_active: Boolean
      media:
        thumb: String
        big: String
        pictures: Array
        videos: Array
        preview: String

    if project is null
      project = mongoose.model('Projects', new mongoose.Schema(schema))

  all: (callback) ->
    @model()
    project.find {}, (err, docs) ->
      callback(docs)

  actives: (callback) ->
    @model()
    project.find {is_active: true}, (err, docs) ->
      callback(docs)
