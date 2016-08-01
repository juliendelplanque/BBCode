tests-visiting
testVisitBBCFontSizeNode
	| fontSizeNode |
	fontSizeNode := (BBCFontSize fontSize: 10)
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	fontSizeNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="font-size:10px">hello you</span>'