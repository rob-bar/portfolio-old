mongoose = require "mongoose"
nav = null

exports.data =
  model: ->
    schema =
      name: String
      url: String
      is_active: Boolean

    if nav is null then nav = mongoose.model "Navs", new mongoose.Schema schema

  all: (callback) ->
    @model()
    nav.find {}, (err, docs) -> callback docs

  actives: (callback) ->
    @model()
    nav.find {is_active: true}, (err, docs) -> callback docs
