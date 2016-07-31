tests-visiting
testVisitBBCFontColourNode
	| fontColorNode |
	fontColorNode := (BBCFontColour fontColour: 'red')
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	fontColorNode accept: exporter.
	
	self assert: exporter contents equals: '[color=red]hello you[/color]'