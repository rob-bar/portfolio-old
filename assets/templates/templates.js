define(['jade'], function(jade) { if(jade && jade['runtime'] !== undefined) { jade = jade.runtime; }

this["JST"] = this["JST"] || {};

this["JST"]["assets/templates/link"] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),link = locals_.link;buf.push("<li class=\"link rect item\"><img src=\"img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attrs({ 'href':(link.u), 'target':("_blank") }, {"href":true,"target":true})) + "><span class=\"deliicon\"></span><span class=\"deliinfo\">" + (jade.escape(null == (jade.interp = link.d) ? "" : jade.interp)) + "</span></a></li>");;return buf.join("");
};

this["JST"]["assets/templates/pic"] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),pic = locals_.pic;buf.push("<li class=\"pic rect item\"><img src=\"img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a href=\"#\" target=\"_blank\">");
if ( pic.images)
{
buf.push("<img" + (jade.attrs({ 'src':(pic.images.thumbnail.url), 'alt':("test") }, {"src":true,"alt":true})) + "/>");
}
buf.push("</a></li>");;return buf.join("");
};

this["JST"]["assets/templates/project"] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),project = locals_.project;buf.push("<li" + (jade.attrs({ 'data-title':("" + (project.title) + ""), "class": [('work'),('item')] }, {"data-title":true})) + "><img src=\"img/layout/shade-310.png\" alt=\"shade\" class=\"shade\"/><div class=\"inner\"><img" + (jade.attrs({ 'src':("img/projects/thumbs/" + (project.media.thumb) + ""), 'alt':("thumb"), "class": [('thumb')] }, {"src":true,"alt":true})) + "/><div class=\"insetshade\"></div><div class=\"likes normal\"><a href=\"#\" class=\"heart\"></a></div></div></li>");;return buf.join("");
};

this["JST"]["assets/templates/repo"] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),repo = locals_.repo;buf.push("<li class=\"repo rect item\"><img src=\"img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attrs({ 'href':(repo.html_url), 'target':("_blank") }, {"href":true,"target":true})) + "><span class=\"repoicon\"></span><span class=\"githubicon\"></span><span class=\"repoinfo\"><span>" + (jade.escape(null == (jade.interp = repo.name) ? "" : jade.interp)) + "</span></span></a></li>");;return buf.join("");
};

this["JST"]["assets/templates/tweet"] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),tweet = locals_.tweet;buf.push("<li class=\"tweet rect item\"><img src=\"img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attrs({ 'href':("http://twitter.com/robbiebardijn/status/" + (tweet.id_str) + ""), 'target':("_blank") }, {"href":true,"target":true})) + "><span class=\"tweeticon\"></span><span class=\"visuallyhidden\">" + (jade.escape(null == (jade.interp = tweet.text) ? "" : jade.interp)) + "</span></a></li>");;return buf.join("");
};

return this["JST"];

});