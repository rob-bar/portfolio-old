mongoose = require 'mongoose'
mongoose.connect "mongodb://localhost/portfolio"
social = null

exports.data =
	model: ->
		schema =
			name: String
			url: String
			is_active: Boolean

		if social is null
			social = mongoose.model('Socials', new mongoose.Schema(schema))

	all:(callback) ->
		@model()
		social.find {}, (err, docs) ->
			callback(docs)