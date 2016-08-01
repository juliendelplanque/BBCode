visiting
visitBBCLinkNode: aBBCLinkNode
	self writeBBCNodeOnHTMLStream: aBBCLinkNode withTag: 'a' parameters: { 'href' -> aBBCLinkNode subnodes first text } asDictionary