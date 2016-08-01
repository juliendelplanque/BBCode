visiting
visitBBCResizedImageNode: aBBCResizedImageNode
	writeStream
		<< $[;
		<< aBBCResizedImageNode tagName;
		space;
		<< 'HEIGHT="';
		<< aBBCResizedImageNode height;
		<< '" WIDTH="';
		<< aBBCResizedImageNode width;
		<< '"]'.

	aBBCResizedImageNode subnodes do: [ :subnode | subnode accept: self ].
	
	writeStream
		<< '[/';
		<< aBBCResizedImageNode tagName;
		<< $].