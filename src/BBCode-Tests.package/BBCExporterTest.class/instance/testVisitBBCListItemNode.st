tests-visiting
testVisitBBCListItemNode
	| listItemNode |
	listItemNode := BBCListItem new
						subnodes: {(BBCText fromString: 'hello')};
						yourself.
	
	listItemNode accept: exporter.
	
	self assert: exporter contents equals: '[li]hello[/li]'