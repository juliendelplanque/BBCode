visiting
visitBBCItalicNode: aBBCItalicNode
	aBBCItalicNode subnodes do: [ :node | node accept: self ]