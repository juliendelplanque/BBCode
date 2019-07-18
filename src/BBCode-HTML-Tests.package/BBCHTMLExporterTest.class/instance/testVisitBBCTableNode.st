tests-visiting
testVisitBBCTableNode
	| tableNode |
	tableNode := BBCTable new.

	tableNode  
		addSubnode: (BBCTableRow new 
			addSubnode: (BBCTableHeadingCell new addSubnode: (BBCText fromString: 'hello'); yourself); yourself);
		addSubnode: (BBCTableRow new 
			addSubnode: (BBCTableContentCell new addSubnode: (BBCText fromString: 'you'); yourself); yourself).
	
	tableNode accept: exporter.
	
	self assert: exporter contents equals: '<table><tr><th>hello</th></tr><tr><td>you</td></tr></table>'