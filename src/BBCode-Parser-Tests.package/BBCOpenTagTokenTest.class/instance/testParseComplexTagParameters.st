tests-private - parsing
testParseComplexTagParameters
	token parseComplexTagParameters: 'WIDTH="400" HEIGHT="200"' readStream.
	self assert: token parametersDict size equals: 2.
	
	self assert: ((token parametersDict keys) includesAll: { 'WIDTH' . 'HEIGHT' }).
	
	self assert: (token parametersDict at: 'WIDTH') equals: '400'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '200'