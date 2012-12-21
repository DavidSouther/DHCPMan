pretty = ->
	(json)->
		if _(json).isString!
			json = JSON.parse json
		JSON.stringify json, null, 4

angular.module \jefri
	.filter \prettyjson, pretty
