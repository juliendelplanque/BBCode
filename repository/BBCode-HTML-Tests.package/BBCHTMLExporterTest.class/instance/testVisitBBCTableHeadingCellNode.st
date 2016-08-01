tests-visiting
testVisitBBCTableHeadingCellNode
	| headingCellNode |
	headingCellNode := BBCTableHeadingCell new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	headingCellNode accept: exporter.
	
	self assert: exporter contents equals: '<th>hello you</th>'