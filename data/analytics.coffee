mongoose = require "mongoose"
analytics = null

exports.data =
  model: ->
    schema =
      title: String
      value: Number

    if analytics is null then analytics = mongoose.model "Analytics", new mongoose.Schema schema

  all: (callback) ->
    @model()
    analytics.find {}, (err, docs) -> callback docs

  add_cv_link_click: (callback) ->
    @model()
    analytics.update {'title': 'cv_download_count'}, { $inc: { value: 1 }}, (err, affected) ->
      if err then handleError err
      callback affected
