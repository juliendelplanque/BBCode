tests-visiting
testVisitBBCTableHeadingCellNode
	| headingCellNode |
	headingCellNode := BBCTableHeadingCell new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	headingCellNode accept: exporter.
	
	self assert: exporter contents equals: '[th]hello you[/th]'