visiting
visitBBCTableRowNode: aBBCTableRowNode
	(aBBCTableRowNode subnodes
		anySatisfy: [ :subnode | (#(BBCTableContentCell BBCTableHeadingCell) includes: subnode className) not ])
		ifTrue: [ BBCBadFormat signal: 'Sub-elements of an table row must be content cells or heading cells.' ].
	
	aBBCTableRowNode subnodes do: [ :node | node accept: self ]