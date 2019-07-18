visiting
visitBBCImageNode: aBBCImageNode
	writeStream
		<< $<;
		<< 'img';
		space;
		<< 'src="';
		<< aBBCImageNode subnodes first text;
		<< '"';
		<< '/>'.