projects = [
  {
  title: "Bestnetwork"
  client: "Proximus"
  type_id: "website"
  likes: 0
  launch_date: new Date(2013, 3, 22)
  description: "This project was a very fun one.<br><br>
The website was meant to be a teasing website for people who wanted to get to know the Proximus network.
For Proximus itself it was important that they could use this website as an entertaining website with some new and fancy things in it.
The idea was to work on great content, cartoons, facts and information.
So actually it was just a content website, but there was more to it than that.<br><br>
The website has a detection build in to serve the mobile or the desktop website based on the browser.
the main reason for doing so was the difference between the desktop and the mobile site.
As you can see the desktop has a css 3D effect built into (horizontally) and the mobile site has a lazy loading vertical scrolling system.
The main reason why we used the m.domain technique instead of going for a responsive website.<br><br>
We chose to separate the data with a rest service and to work with Backbone.js on the front-end.
This gave us the ability to separate the project better in nicely encapsulated layers.
There was another fun feature built in that gave you the ability to control the main menu and items with a remote control (your smartphone).
For that we used Socket.io and Node to create rooms between the desktops and the remotes.
You should try it out."
  is_active: true
  media:
    thumb: "proximus-bestnetwork.jpg"
    big: "proximus-bestnetwork.jpg"
    pictures: []
    videos: []
    preview: "http://www.bestnetwork.be"
  tags: ["php", "coffeescript", "fuelphp", "jquery", "backbone", "handlebars", "grunt", "node", "socket.io", "html5", "css3", "sass", "3d", "website", "mobile site"]
  }, {
  title: "Tetris"
  client: "No client, just for fun"
  type_id: "game"
  likes: 0
  launch_date: new Date(2012, 4, 20)
  description: "This was a HTML5 game I developed for fun, to spend my time getting to know Javascript and the HTML5 canvas element.
To add in a little challenge I wanted to use the Facebook api to let users connect with their Facebook credentials.
Everything, from design to the Facebook api to the Javascript was done by me.<br><br>
For now the game is off-line.
You might want to come back and play it later,
I'm optimizing it and puting it with the rest of my games.
"
  is_active: true
  media:
    thumb: "own-tetris.jpg"
    big: "own-tetris.jpg"
    pictures: []
    videos: []
    preview: ""
  tags: ["html5", "css3", "javascript", "jquery", "facebook", "game"]
  }
]


tags = [
  {name: "canvas", kind: "tech"},
  {name: "requirejs", kind: "tech"},
  {name: "codeigniter", kind: "tech"},
  {name: "fuelphp", kind: "tech"},
  {name: "jquery", kind: "tech"},
  {name: "backbone", kind: "tech"},
  {name: "handlebars", kind: "tech"},
  {name: "grunt", kind: "tech"},
  {name: "after effects", kind: "tech"},
  {name: "node", kind: "tech"},
  {name: "socket.io", kind: "tech"},
  {name: "flash", kind: "tech"},
  {name: "youtube", kind: "api"},
  {name: "facebook", kind: "api"},
  {name: "google maps", kind: "api"},
  {name: "php", kind: "lang"},
  {name: "coffeescript", kind: "lang"},
  {name: "javascript", kind: "lang"},
  {name: "as", kind: "lang"},
  {name: "html5", kind: "lang"},
  {name: "css3", kind: "lang"},
  {name: "sass", kind: "lang"},
  {name: "less", kind: "lang"},
  {name: "3d", kind: "cat"},
  {name: "video", kind: "cat"},
  {name: "responsive site", kind: "cat"},
  {name: "mobile site", kind: "cat"},
  {name: "website", kind: "cat"},
  {name: "landing page", kind: "cat"},
  {name: "b2b website", kind: "cat"},
  {name: "game", kind: "cat"}
]

db.tags.drop()
db.projects.drop()

for key, tag of tags
  db.tags.insert tag

for key, project of projects
  project.type_id = db.tags.findOne({"name": project.type_id})._id

  for tag, key in project.tags
    project.tags[key] = db.tags.findOne({"name": tag})._id

  db.projects.insert project