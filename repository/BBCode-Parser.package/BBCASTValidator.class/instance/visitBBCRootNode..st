visiting
visitBBCRootNode: aBBCRootNode
	aBBCRootNode subnodes do: [ :node | node accept: self ]