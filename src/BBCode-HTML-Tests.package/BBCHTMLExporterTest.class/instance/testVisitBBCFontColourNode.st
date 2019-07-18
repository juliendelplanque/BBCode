tests-visiting
testVisitBBCFontColourNode
	| fontColorNode |
	fontColorNode := (BBCFontColour fontColour: 'red')
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	fontColorNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="color:red">hello you</span>'