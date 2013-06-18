async = require 'async'
mongoose = require 'mongoose'
config = require '../config/config.coffee'
socials = require '../data/socials.coffee'
navs = require '../data/navs.coffee'

mongoose.connect "mongodb://localhost/portfolio"

exports.other =
	index: (req, res) ->
		crypto = require('crypto')
		md5 = crypto.createHash('md5')
		url = md5.update(config.site.grav.email).digest('hex')
		url = config.site.grav.url.replace /hash/, url

		async.series
			socials: (callback) ->
				socials.data.actives (docs) ->
					callback(null, docs)
			navs: (callback) ->
				navs.data.actives (docs) ->
					callback(null, docs)
			, (err, results) ->
				results.title = "My portfolio"
				results.grav = url
				res.render "pages/index", results
		@
