config = require('../config/config.coffee')
h = require('../config/helper.coffee')
_ = require('underscore')

exports.other =
	index: (req, res) ->
		crypto = require('crypto')
		md5 = crypto.createHash('md5')
		url = md5.update(config.site.grav.email).digest('hex')
		url = config.site.grav.url.replace /hash/, url
		res.render "index", title: "My portfolio", grav_url: url
		@