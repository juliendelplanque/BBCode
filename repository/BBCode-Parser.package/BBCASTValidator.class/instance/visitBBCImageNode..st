visiting
visitBBCImageNode: aBBCImageNode
	aBBCImageNode subnodes size = 1
		ifFalse: [ BBCBadFormat signal: 'Image tags can only contain one sub-element.' ].
		
	aBBCImageNode subnodes first class = BBCText
		ifFalse: [ BBCBadFormat signal: 'Image tags can only contain text as sub-element.' ]