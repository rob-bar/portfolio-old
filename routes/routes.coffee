config = require('../config/config.coffee')
socials = require('../data/socials.coffee')
exports.other =
	index: (req, res) ->
		crypto = require('crypto')
		md5 = crypto.createHash('md5')
		url = md5.update(config.site.grav.email).digest('hex')
		url = config.site.grav.url.replace /hash/, url
		socials.data.all (docs) ->
			res.render "pages/index", title: "My portfolio", socials: docs
		@