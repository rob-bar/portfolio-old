mongoose = require 'mongoose'
mongoose.connect "mongodb://localhost/portfolio"
nav = null

exports.data =
	model: ->
		schema =
			name: String
			url: String
			is_active: Boolean

		if nav is null
			nav = mongoose.model('Navs', new mongoose.Schema(schema))

	all:(callback) ->
		@model()
		nav.find {}, (err, docs) ->
			callback(docs)
