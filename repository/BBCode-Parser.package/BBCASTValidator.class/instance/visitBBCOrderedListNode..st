visiting
visitBBCOrderedListNode: aBBCOrderedListNode
	(aBBCOrderedListNode subnodes
		anySatisfy: [ :subnode | subnode class ~= BBCListItem ])
		ifTrue: [ BBCBadFormat signal: 'Sub-elements of an ordered list must be list items.' ].
	
	aBBCOrderedListNode subnodes do: [ :node | node accept: self ]