tests-visiting
testVisitBBCTableNode
	| tableNode |
	tableNode := BBCTable new.

	tableNode subnodes: { 
		BBCTableRow new subnodes: {
			BBCTableHeadingCell new subnodes: { BBCText fromString: 'hello' }; yourself
		}; yourself.
		BBCTableRow new subnodes: {
			BBCTableContentCell new subnodes: { BBCText fromString: 'you' }; yourself
		}; yourself. }.
	
	tableNode accept: exporter.
	
	self assert: exporter contents equals: '[table][tr][th]hello[/th][/tr][tr][td]you[/td][/tr][/table]'