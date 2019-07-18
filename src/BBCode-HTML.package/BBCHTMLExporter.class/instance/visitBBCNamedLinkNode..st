visiting
visitBBCNamedLinkNode: aBBCNamedLinkNode
	writeStream
		<< '<a href="';
		<< aBBCNamedLinkNode url;
		<< '">';
		<< aBBCNamedLinkNode subnodes first text;
		<< '</a>'.