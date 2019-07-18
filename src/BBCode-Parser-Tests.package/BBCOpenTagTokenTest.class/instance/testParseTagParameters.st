tests-private - parsing
testParseTagParameters
	token parseTagParameters: '=Pharo' readStream.
	
	self assert: token parametersDict isNil.
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	token parseTagParameters: ' WIDTH="400" HEIGHT="200"' readStream.
	
	self assert: token simpleTagParameter isNil.
	self assert: (token parametersDict keys includesAll: { 'WIDTH' . 'HEIGHT' }).
	self assert: (token parametersDict at: 'WIDTH') equals: '400'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '200'