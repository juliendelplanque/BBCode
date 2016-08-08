visiting
visitBBCResizedImageNode: aBBCResizedImageNode
	aBBCResizedImageNode subnodes size = 1
		ifFalse: [ BBCBadFormat signal: 'Image tags can only contain one sub-element.' ].
		
	aBBCResizedImageNode subnodes first class = BBCText
		ifFalse: [ BBCBadFormat signal: 'Image tags can only contain text as sub-element.' ].