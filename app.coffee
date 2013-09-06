express = require "express"
routes = require "./routes"
path = require "path"
http = require "http"
config = require "./config/config.coffee"

process.env.NODE_ENV = config.site.mode

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
  app.use express.errorHandler dumpExceptions: true, showStack: true
  config.site.host = "local.#{config.site.host}"
  @

app.configure 'production', ->
  app.use express.errorHandler()
  @

# ROUTES
app.get '/', routes.other.index

# REST
app.get '/rest/:collection', (req, res) ->
  routes.rest[req.params.collection](req, res)

# CV LINK
app.get '/downloads/curriculumvitea.pdf', routes.other.cv

http.createServer(app).listen config.site.port, config.site.host, ->
  console.log "#{config.site.title} listening on port #{config.site.port}"
