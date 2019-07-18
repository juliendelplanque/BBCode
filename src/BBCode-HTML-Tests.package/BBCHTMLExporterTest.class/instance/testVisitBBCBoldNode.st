tests-visiting
testVisitBBCBoldNode
	| boldNode |
	boldNode := BBCBold new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	boldNode accept: exporter.
	
	self assert: exporter contents equals: '<b>hello you</b>'