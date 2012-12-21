angular.classmap = !(module, map)-->
	for clas, list of map
		let
			directive = ->
				restrict: \C
				link: !(scope, $el) ->
					$el.addClass list

			angular.module module
				.directive clas, directive

angular.dhcpmanmap = angular.classmap \dhcpman

angular.module \dhcpman, <[ jefri jquery ui ]>, !($routeProvider)->
	$routeProvider
		.when '/', template: jQuery.template \#hosts
		.when '/hosts', template: jQuery.template \#hosts
		.when '/routers', template: jQuery.template \#routers

angular.dhcpmanmap do
	menu: "navbar navbar-inverse navbar-fixed-top"
	content: "container"