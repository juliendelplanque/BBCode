visiting
visitBBCTableNode: aBBCTableNode
	(aBBCTableNode subnodes anySatisfy: [ :subnode | subnode class ~= BBCTableRow ])
		ifTrue: [ BBCBadFormat signal: 'Sub-elements of an table must be table rows.' ].
	
	aBBCTableNode subnodes do: [ :node | node accept: self ]