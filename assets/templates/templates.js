define(['jade'], function(jade) { if(jade && jade['runtime'] !== undefined) { jade = jade.runtime; }

this["JST"] = this["JST"] || {};

this["JST"]["assets/templates/link"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),model = locals_.model;
buf.push("<img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attr("href", model.url, true, false)) + " target=\"_blank\"><span class=\"deliicon\"></span><span class=\"deliinfo\">" + (jade.escape(null == (jade.interp = model.name) ? "" : jade.interp)) + "</span></a>");;return buf.join("");
};

this["JST"]["assets/templates/me"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),grav = locals_.grav;
buf.push("<div class=\"hide inback\"><div class=\"baloon item\"><div class=\"norm large\"><img src=\"/img/layout/shade-310.png\" alt=\"shade\" class=\"shade\"/><img src=\"/img/ui/arrows/baloon-white.png\" alt=\"arrow\" class=\"arrow\"/><h1>Robbie Bardijn</h1><p><a href=\"mailto:robbie.bardijn@gmail.com\">robbie.bardijn@gmail.com</a></p><p><a href=\"tel: 0032472798863\" class=\"tel\">0472 / 79.88.63</a></p></div><div class=\"hov large\"><img src=\"/img/layout/shade-310.png\" alt=\"shade\" class=\"shade\"/><img src=\"/img/ui/arrows/baloon-blue.png\" alt=\"arrow\" class=\"arrow\"/><h1>Hire me...</h1><p>I’m glad to help</p></div></div><div class=\"pic rect item\"><img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><img" + (jade.attr("src", "" + (grav) + "", true, false)) + "/></div><div class=\"cv rect item\"><img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a href=\"/downloads/curriculumvitea.pdf\" target=\"_blank\"><span class=\"linkicon\"></span><span class=\"text\">Curriculum Vitae</span></a></div></div>");;return buf.join("");
};

this["JST"]["assets/templates/pic"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),model = locals_.model;
buf.push("<img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a href=\"#\" target=\"_blank\">");
if ( model.images)
{
buf.push("<img" + (jade.attr("src", model.images.thumbnail.url, true, false)) + " alt=\"test\"/>");
}
buf.push("</a>");;return buf.join("");
};

this["JST"]["assets/templates/project"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),model = locals_.model;
buf.push("<img src=\"/img/layout/shade-310.png\" alt=\"shade\" class=\"shade\"/><div class=\"inner\"><img" + (jade.attr("src", "/img/projects/thumbs/" + (model.media.thumb) + "", true, false)) + " alt=\"thumb\" class=\"thumb\"/><div class=\"insetshade\"></div><div class=\"likes normal\"><a href=\"#\" class=\"heart\"></a></div></div>");;return buf.join("");
};

this["JST"]["assets/templates/projectdetail"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),model = locals_.model;
buf.push("<a href=\"#\" class=\"prev\"><i></i></a><a href=\"#\" class=\"next\"><i></i></a><a href=\"#\" class=\"close\"><i></i></a><div class=\"panel\"><div class=\"gallery\"><div class=\"media\"></div><div class=\"indic\"></div><a href=\"#\" class=\"tags\"></a><a href=\"#\" class=\"like\">" + (jade.escape(null == (jade.interp = model.likes + " likes") ? "" : jade.interp)) + "</a></div><aside><header><h3>" + (jade.escape(null == (jade.interp = model.name) ? "" : jade.interp)) + "</h3><h4><strong>Client:</strong><span>" + (jade.escape(null == (jade.interp = model.client) ? "" : jade.interp)) + "</span></h4><h4><strong>Type:</strong><span>" + (jade.escape(null == (jade.interp = model.type) ? "" : jade.interp)) + "</span></h4></header>" + (null == (jade.interp = model.description) ? "" : jade.interp) + "<div class=\"actions\"><a href=\"#\" class=\"visitsite\">Visite Website</a><a href=\"#\" class=\"like\">Like</a></div></aside></div>");;return buf.join("");
};

this["JST"]["assets/templates/repo"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),model = locals_.model;
buf.push("<img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attr("href", "" + (model.url) + "", true, false)) + " target=\"_blank\"><span class=\"repoicon\"></span><span class=\"repoinfo\"><span></span>" + (jade.escape(null == (jade.interp = model.name) ? "" : jade.interp)) + "</span></a>");;return buf.join("");
};

this["JST"]["assets/templates/tweet"] = function template(locals) {
var buf = [];
var jade_mixins = {};
var locals_ = (locals || {}),id = locals_.id,text = locals_.text;
buf.push("<img src=\"/img/layout/shade-150.png\" alt=\"shade\" class=\"shade\"/><a" + (jade.attr("href", "http://twitter.com/robbiebardijn/status/" + (id) + "", true, false)) + " target=\"_blank\"><span class=\"tweeticon\"></span><span class=\"visuallyhidden\">" + (jade.escape(null == (jade.interp = text) ? "" : jade.interp)) + "</span></a>");;return buf.join("");
};

return this["JST"];

});