host = !(scope, dhcpman)->
	scope <<<
		hosts: dhcpman.hosts
	dhcpman.loaded :> !->
		scope.hosts = dhcpman.hosts
		unless scope.$$phase then scope.$apply!

angular.module \dhcpman
	.controller \Host, [\$scope, \dhcpman, host]

angular.dhcpmanmap do
	title: "hero-unit"
	hostTable: "table table-striped"