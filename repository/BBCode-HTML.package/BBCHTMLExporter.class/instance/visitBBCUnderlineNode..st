visiting
visitBBCUnderlineNode: aBBCUnderlineNode
	self writeBBCNodeOnHTMLStream: aBBCUnderlineNode withTag: 'span' parameters: { 'style' -> 'text-decoration:underline' } asDictionary