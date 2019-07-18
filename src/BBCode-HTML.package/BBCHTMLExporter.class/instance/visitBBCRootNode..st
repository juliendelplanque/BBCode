visiting
visitBBCRootNode: aBBCRootNode
	[ aBBCRootNode subnodes do: [ :subnode |
			subnode accept: self ]
	] ensure: [ writeStream close ].