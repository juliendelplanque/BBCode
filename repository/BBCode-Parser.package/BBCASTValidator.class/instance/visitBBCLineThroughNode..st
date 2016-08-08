visiting
visitBBCLineThroughNode: aBBCLineThroughNode
	aBBCLineThroughNode subnodes do: [ :node | node accept: self ]