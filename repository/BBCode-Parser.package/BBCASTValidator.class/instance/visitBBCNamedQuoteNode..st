visiting
visitBBCNamedQuoteNode: aBBCNamedQuoteNode
	aBBCNamedQuoteNode subnodes do: [ :node | node accept: self ]