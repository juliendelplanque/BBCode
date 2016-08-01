helper
writeBBCNodeOnHTMLStream: aBBCNode withTag: anHTMLTag parameters: aDictionary
	writeStream
		<< $<;
		<< anHTMLTag.
	aDictionary keysAndValuesDo: [ :key :value |
		writeStream
			space;
			<< key;
			<< '="';
			<< value;
			<< $"
	].
	writeStream
		<< $>.
	aBBCNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '</';
		<< anHTMLTag;
		<< $>.