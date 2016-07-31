tests-visiting
testVisitBBCItalicNode
	| italicNode |
	italicNode := BBCItalic new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	italicNode accept: exporter.
	
	self assert: exporter contents equals: '[i]hello you[/i]'