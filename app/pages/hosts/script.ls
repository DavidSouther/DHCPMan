host = !(scope, dhcpman)->
	scope <<<
		hosts: dhcpman.hosts
		create: !->
			dhcpman.create \Host
	dhcpman.loaded :> !->
		scope.hosts = dhcpman.hosts
		unless scope.$$phase then scope.$apply!

angular.module \dhcpman
	.controller \Host, [\$scope, \dhcpman, \JEFRi, host]

angular.dhcpmanmap do
	title: "hero-unit"
	hostTable: "table table-striped"
	create: "btn btn-primary"