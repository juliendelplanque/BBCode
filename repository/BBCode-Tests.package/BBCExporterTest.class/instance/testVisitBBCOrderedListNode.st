tests-visiting
testVisitBBCOrderedListNode
	| listNode |
	listNode := BBCOrderedList new
							subnodes: {BBCListItem new subnodes: {(BBCText fromString: 'hello')}; yourself};
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '[ol][li]hello[/li][/ol]'