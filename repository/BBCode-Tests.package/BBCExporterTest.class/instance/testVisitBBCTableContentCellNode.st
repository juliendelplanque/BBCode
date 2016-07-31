tests-visiting
testVisitBBCTableContentCellNode
	| contentCellNode |
	contentCellNode := BBCTableContentCell new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	contentCellNode accept: exporter.
	
	self assert: exporter contents equals: '[td]hello you[/td]'