tests-private - parsing
testParseComplexTagParameterName
	| name |
	name := token parseComplexTagParameterName: 'WIDTH="400" HEIGHT="200"' readStream.
	self assert: name equals: 'WIDTH'.
	
	self should: [ token parseComplexTagParameterName: '="400" HEIGHT="200"' readStream ] raise: BBCBadFormat