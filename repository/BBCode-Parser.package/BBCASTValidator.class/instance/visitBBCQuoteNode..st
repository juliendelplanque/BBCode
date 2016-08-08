visiting
visitBBCQuoteNode: aBBCQuoteNode
	aBBCQuoteNode subnodes do: [ :node | node accept: self ]