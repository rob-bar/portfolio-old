express = require "express"
routes = require "./routes"
path = require "path"
http = require "http"
app = do express
mongoose = require "mongoose"

app.configure ->
	app.set 'port', 8088
	app.set 'title', 'Portfolio'
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use(express.static(path.join(__dirname, 'assets')))
	@

app.configure 'development', ->
	app.use express.errorHandler()
	@


# ROUTES
app.get '/', routes.other.index

http.createServer(app).listen(app.get('port'), "node.portfolio", ()->
	console.log "Express server listening on port " + app.get('port')
)