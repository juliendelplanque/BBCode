visiting
visitBBCNamedLinkNode: aBBCNamedLinkNode
	aBBCNamedLinkNode subnodes size = 1
		ifFalse: [ BBCBadFormat signal: 'Link tags can only contain one sub-element.' ].
		
	aBBCNamedLinkNode subnodes first class = BBCText
		ifFalse: [ BBCBadFormat signal: 'Link tags can only contain text as sub-element.' ]