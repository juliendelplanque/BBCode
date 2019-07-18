tests-visiting
testVisitBBCTableContentCellNode
	| contentCellNode |
	contentCellNode := BBCTableContentCell new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	contentCellNode accept: exporter.
	
	self assert: exporter contents equals: '<td>hello you</td>'