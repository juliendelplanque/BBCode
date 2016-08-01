tests-visiting
testVisitBBCUnderlineNode
	| underlineNode |
	underlineNode := BBCUnderline new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	underlineNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="text-decoration:underline">hello you</span>'