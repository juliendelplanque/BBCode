visiting
visitBBCRootNode: aBBCRootNode
	self flag: #'todo?'.
	[ aBBCRootNode subnodes do: [ :subnode |
			subnode accept: self ]
	] ensure: [ writeStream close ]