dhcpman = (JEFRi)->
	class dhcpman
		->
			JEFRi.ready.then !~>
				@load!
				@loaded <: {}

		load: !->
			data = [
				["mud", "216.146.97.60", "18:03:73:af:00:b2"],
				["opal", "216.146.97.50", "fa:54:ef:33:9c:e5"],
				["time", "216.146.96.78", "00:1a:4a:92:61:01"]
			]
			@hosts = for host in data
				JEFRi.build \Host, {hostname: host[0], ip: host[1], mac: host[2]}

		hosts: []

		NAMESPACE: _.UUID.v5 \dhcpman

	new dhcpman!

angular.module \dhcpman
	.factory \dhcpman, [\JEFRi, dhcpman]
