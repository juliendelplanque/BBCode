tests-visiting
testVisitBBCBoldNode
	| boldNode |
	boldNode := BBCBold new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	boldNode accept: exporter.
	
	self assert: exporter contents equals: '[b]hello you[/b]'