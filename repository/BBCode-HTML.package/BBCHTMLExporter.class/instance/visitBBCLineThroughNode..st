visiting
visitBBCLineThroughNode: aBBCLineThroughNode
	self writeBBCNodeOnHTMLStream: aBBCLineThroughNode withTag: 'div' parameters: { 'style' -> 'text-decoration:line-through' } asDictionary