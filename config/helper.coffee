https = require "https"
http = require "http"
config = require "./config.coffee"
oauth2 = require("oauth").OAuth2

exports.help =
  oauth2: new oauth2(config.site.twitter.key, config.site.twitter.secret, 'https://api.twitter.com/', null, 'oauth2/token', null)

  securerequest: (options, callback) ->
    console.log options
    request = https.request options, (res)->
      data = []

      res.on 'data', (chunk)->
        data.push(chunk)

      res.on 'error', (e)->
        console.log "Got error: #{e.message}"

      res.on 'end', ()->
        console.log res.data
        data = JSON.parse data.join('')
        callback(data)
    request.end()

  request: (options, callback) ->
    request = http.request options, (res)->
      data = []

      res.on 'data', (chunk)->
        data.push(chunk)

      res.on 'error', (e)->
        console.log "Got error: #{e.message}"

      res.on 'end', ()->
        data = JSON.parse data.join('')
        callback(data)
    request.end()

  oauthtoken: (callback) ->
    @oauth2.getOAuthAccessToken '', {'grant_type': 'client_credentials'}, (e, access_token) ->
      callback access_token
