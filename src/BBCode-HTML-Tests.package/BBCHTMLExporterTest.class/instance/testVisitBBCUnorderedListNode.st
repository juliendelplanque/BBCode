tests-visiting
testVisitBBCUnorderedListNode
	| listNode |
	listNode := BBCUnorderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'));
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '<ul><li>hello</li></ul>'