visiting
visitBBCUnorderedListNode: aBBCUnorderedListNode
	(aBBCUnorderedListNode subnodes
		anySatisfy: [ :subnode | subnode class ~= BBCListItem ])
		ifTrue: [ BBCBadFormat signal: 'Sub-elements of an unordered list must be list items.' ].
	
	aBBCUnorderedListNode subnodes do: [ :node | node accept: self ]