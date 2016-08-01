tests-visiting
testVisitBBCTableRowNode
	| rowNode |
	rowNode := BBCTableRow new
						addSubnode: (BBCTableContentCell new addSubnode: (BBCText fromString: 'hello'));
						yourself.
	
	rowNode accept: exporter.
	
	self assert: exporter contents equals: '<tr><td>hello</td></tr>'