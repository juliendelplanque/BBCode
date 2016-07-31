tests-visiting
testVisitBBCUnderlineNode
	| underlineNode |
	underlineNode := BBCUnderline new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	underlineNode accept: exporter.
	
	self assert: exporter contents equals: '[u]hello you[/u]'