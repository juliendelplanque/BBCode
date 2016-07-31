helper
writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCSimpleParameterizedNode
	writeStream
		<< $[;
		<< aBBCSimpleParameterizedNode tagName;
		<< $=;
		<< aBBCSimpleParameterizedNode parameter;
		<< $].
	aBBCSimpleParameterizedNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '[/';
		<< aBBCSimpleParameterizedNode tagName;
		<< $].