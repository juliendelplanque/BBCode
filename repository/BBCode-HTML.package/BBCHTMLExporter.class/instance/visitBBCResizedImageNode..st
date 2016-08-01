visiting
visitBBCResizedImageNode: aBBCResizedImageNode
	writeStream
		<< $<;
		<< 'img';
		space;
		<< 'src="';
		<< aBBCResizedImageNode subnodes first text;
		<< '" height="';
		<< aBBCResizedImageNode height;
		<< '" width="';
		<< aBBCResizedImageNode width;
		<< '"/>'.