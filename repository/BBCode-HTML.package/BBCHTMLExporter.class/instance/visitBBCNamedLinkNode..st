visiting
visitBBCNamedLinkNode: aBBCNamedLinkNode
	writeStream
		<< '<a href="';
		<< aBBCNamedLinkNode subnodes first text;
		<< '">';
		<< aBBCNamedLinkNode linkName;
		<< '</a>'.