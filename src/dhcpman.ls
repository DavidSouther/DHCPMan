require! { server: "jefri-server", express, fs, _: superscore }

server.get '/', !(req, res)->
	res.sendfile "build/index.html"

server.post '/write', !(req, res)->
	config = ""
	routers = server.jefri.runtime.find \Router
	_(routers).each ->
		config += "group { \# #{it.name!}\n"
		config += "\toption routers #{it.gateway!};\n"
		config += "\toption subnet-mask #{it.mask!};\n"
		_(it.hosts!).each ->
			config += "\thost #{it.hostname!} {\n"
			config += "\t\thardware ethernet #{it.mac!};\n"
			config += "\t\tfixed-address #{it.ip!};\n"
			config += "\t}\n"
		config += "}\n"
	console.log config

server.jefri.runtime.load "http://localhost:3000/dhcpman.json"

server.use '/', express.static 'build/'

server.listen 3000