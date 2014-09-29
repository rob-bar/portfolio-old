mongoose = require "mongoose"
async = require "async"
tag = null

exports.data =
  model: ->
    schema =
      name: String
      kimd: String

    if tag is null then tag = mongoose.model "Tags", new mongoose.Schema schema

  all: (callback) ->
    @model()
    tag.find {}, (err, docs) -> callback docs

  by_id: (id, callback) ->
    @model()
    tag.findOne {_id: id}, (err, docs) -> callback docs

  by_ids: (ids, callback) ->
    @model()
    mytags = []
    async.each ids, (id, cb) ->
      tag.findOne {_id: id}, (err, doc) ->
        mytags.push doc
        do cb
    , (err)->
      callback mytags
