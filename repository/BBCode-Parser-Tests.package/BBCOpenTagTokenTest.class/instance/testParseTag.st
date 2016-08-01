tests-private - parsing
testParseTag
	token parseTag: 'b'.
	self assert: token tag equals: 'b'.
	
	token parseTag: 'url=Pharo'.
	self assert: token tag equals: 'url'.
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	token parseTag: 'img HEIGHT="400" WIDTH="200"'.
	self assert: ((token parametersDict keys) includesAll: { 'WIDTH' . 'HEIGHT' }).
	self assert: (token parametersDict at: 'WIDTH') equals: '200'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '400'