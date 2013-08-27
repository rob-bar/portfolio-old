express = require "express"
routes = require "./routes"
path = require "path"
http = require "http"
config = require "./config/config.coffee"

app = do express
mongoose = require "mongoose"

app.configure ->
  app.set 'port', config.site.port
  app.set 'title', config.site.title
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static path.join __dirname, 'assets'
  @

app.configure 'development', ->
  app.use express.errorHandler()
  @

# ROUTES
app.get '/', routes.other.index

http.createServer(app).listen config.site.port, config.site.host, ->
  console.log "#{config.site.title} listening on port #{config.site.port}"
