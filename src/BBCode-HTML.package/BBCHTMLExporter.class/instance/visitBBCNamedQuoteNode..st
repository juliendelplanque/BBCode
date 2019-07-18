visiting
visitBBCNamedQuoteNode: aBBCNamedQuoteNode
	self writeBBCNodeOnHTMLStream: aBBCNamedQuoteNode withTag: 'em'.
	writeStream
		<< ' - ';
		<< aBBCNamedQuoteNode quoteName