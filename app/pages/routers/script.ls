router = !(scope, dhcpman)->
	scope <<<
		routers: dhcpman.routers
		create: !->
			dhcpman.create \Router
	dhcpman.loaded :> !->
		scope.routers = dhcpman.routers
		unless scope.$$phase then scope.$apply!

angular.module \dhcpman
	.controller \Router, [\$scope, \dhcpman, \JEFRi, router]

angular.dhcpmanmap do
	title: "hero-unit"
	routerTable: "table table-striped"
	create: "btn btn-primary"