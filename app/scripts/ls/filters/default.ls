Default = ->
	(input, def)->
		input || def

angular.module \jefri
	.filter \default, Default
