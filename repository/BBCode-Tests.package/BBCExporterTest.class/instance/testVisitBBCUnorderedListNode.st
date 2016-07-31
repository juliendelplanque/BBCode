tests-visiting
testVisitBBCUnorderedListNode
	| listNode |
	listNode := BBCUnorderedList new
							subnodes: {BBCListItem new subnodes: {(BBCText fromString: 'hello')}; yourself};
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '[ul][li]hello[/li][/ul]'