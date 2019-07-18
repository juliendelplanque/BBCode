helper
writeBBCNodeOnStreamWithItsTags: aBBCNode
	writeStream
		<< $[;
		<< aBBCNode tagName;
		<< $].
	aBBCNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '[/';
		<< aBBCNode tagName;
		<< $].