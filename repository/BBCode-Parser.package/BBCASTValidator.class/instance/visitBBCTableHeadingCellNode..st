visiting
visitBBCTableHeadingCellNode: aBBCTableHeadingCellNode
	aBBCTableHeadingCellNode subnodes do: [ :node | node accept: self ]