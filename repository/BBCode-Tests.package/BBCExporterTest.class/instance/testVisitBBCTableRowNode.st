tests-visiting
testVisitBBCTableRowNode
	| rowNode |
	rowNode := BBCTableRow new
						subnodes: {BBCTableContentCell new subnodes: { (BBCText fromString: 'hello')}; yourself};
						yourself.
	
	rowNode accept: exporter.
	
	self assert: exporter contents equals: '[tr][td]hello[/td][/tr]'