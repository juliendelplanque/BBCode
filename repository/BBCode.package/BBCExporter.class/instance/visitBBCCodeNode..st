visiting
visitBBCCodeNode: aBBCCodeNode
	writeStream
		<< $[;
		<< aBBCCodeNode tagName;
		<< $];
		<< aBBCCodeNode code;
		<< '[/';
		<< aBBCCodeNode tagName;
		<< $]