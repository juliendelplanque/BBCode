visiting
visitBBCFontColourNode: aBBCFontColourNode
	aBBCFontColourNode subnodes do: [ :node | node accept: self ]