tests-visiting
testVisitBBCOrderedListNode
	| listNode |
	listNode := BBCOrderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'); yourself);
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '<ol><li>hello</li></ol>'