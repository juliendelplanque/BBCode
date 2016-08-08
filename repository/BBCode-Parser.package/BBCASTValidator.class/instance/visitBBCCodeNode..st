visiting
visitBBCCodeNode: aBBCCodeNode
	aBBCCodeNode subnodes do: [ :node | node accept: self ]