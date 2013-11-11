define [
  'backbone'
  'site'
  'module'
  'model/link'
  'model/pic'
  'model/repo'
  'model/project'
  'model/tweet'
  'model/item'
],
(Backbone, site, module, Link, Pic, Repo, Project, Tweet, Item) ->

  class All extends Backbone.Collection
    model: Item
    url: -> "/#{site.config.rest}/all"
    parse: (resp, xhr) ->
      _.map resp, (attrs) ->
        switch attrs.kind
          when 'link' then new Link attrs
          when 'pic' then new Pic attrs
          when 'repo' then new Repo attrs
          when 'work' then new Project attrs
          when 'tweet' then new Tweet attrs

  module.exports = All
