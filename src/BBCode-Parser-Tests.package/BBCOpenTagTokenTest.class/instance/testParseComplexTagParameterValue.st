tests-private - parsing
testParseComplexTagParameterValue
	| value |
	value := token parseComplexTagParameterValue: '"400" HEIGHT="200"' readStream.
	self assert: value equals: '400'.
	
	value := token parseComplexTagParameterValue: '"" HEIGHT="200"' readStream.
	self assert: value equals: ''