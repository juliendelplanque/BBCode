tests-private - parsing
testParseTagName
	token parseTagName: 'b' readStream.
	
	self assert: token tag equals: 'b'.
	
	token parseTagName: 'url=Pharo' readStream.
	
	self assert: token tag equals: 'url'.
	
	token parseTagName: 'img WIDTH="400" HEIGHT="400"' readStream.
	
	self assert: token tag equals: 'img'