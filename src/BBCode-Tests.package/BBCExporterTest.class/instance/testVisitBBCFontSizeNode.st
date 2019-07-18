tests-visiting
testVisitBBCFontSizeNode
	| fontSizeNode |
	fontSizeNode := (BBCFontSize fontSize: 10)
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	fontSizeNode accept: exporter.
	
	self assert: exporter contents equals: '[size=10]hello you[/size]'