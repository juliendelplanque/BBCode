tests-private - parsing
testParseSimpleTagParameter
	token parseSimpleTagParameter: 'Pharo' readStream.
	
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	self should: [ token parseSimpleTagParameter: '' readStream ] raise: BBCBadFormat