config = require '../config/config.coffee'
async = require 'async'
mongoose = require 'mongoose'
mongoose.connect "mongodb://localhost/portfolio"

socials = require '../data/socials.coffee'
navs = require '../data/navs.coffee'

exports.other =
	index: (req, res) ->
		crypto = require('crypto')
		md5 = crypto.createHash('md5')
		url = md5.update(config.site.grav.email).digest('hex')
		url = config.site.grav.url.replace /hash/, url

		async.series
			socials: (callback) ->
				socials.data.all (docs) ->
					callback(null, docs)
			navs: (callback) ->
				navs.data.all (docs) ->
					callback(null, docs)
			, (err, results) ->
				results.title = "My portfolio"
				res.render "pages/index", results
		@
