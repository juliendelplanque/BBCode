tests-visiting
testVisitBBCRootNode
	| rootNode |
	rootNode := BBCRoot new.
	rootNode
		addSubnode: (BBCText fromString: 'Hello ');
		addSubnode: (BBCBold new 
			addSubnode: (BBCText fromString: 'people');
			yourself);
		addSubnode: (BBCText fromString: ' ');
		addSubnode: (BBCItalic new 
			addSubnode: (BBCText fromString: 'how are you?');
			yourself).
	
	rootNode accept: exporter.
	
	self assert: exporter contents equals: 'Hello <b>people</b> <i>how are you?</i>'