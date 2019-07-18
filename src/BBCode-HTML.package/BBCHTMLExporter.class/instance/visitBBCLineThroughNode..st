visiting
visitBBCLineThroughNode: aBBCLineThroughNode
	self writeBBCNodeOnHTMLStream: aBBCLineThroughNode withTag: 'span' parameters: { 'style' -> 'text-decoration:line-through' } asDictionary