tests-visiting
testVisitBBCListItemNode
	| listItemNode |
	listItemNode := BBCListItem new
						addSubnode: (BBCText fromString: 'hello');
						yourself.
	
	listItemNode accept: exporter.
	
	self assert: exporter contents equals: '<li>hello</li>'