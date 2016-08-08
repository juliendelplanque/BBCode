visiting
visitBBCBoldNode: aBBCBoldNode
	aBBCBoldNode subnodes do: [ :node | node accept: self ]