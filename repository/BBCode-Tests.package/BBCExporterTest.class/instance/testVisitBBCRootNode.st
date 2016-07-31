tests-visiting
testVisitBBCRootNode
	| rootNode |
	rootNode := BBCRoot new.
	rootNode subnodes: {
		BBCText fromString: 'Hello '.
		BBCBold new subnodes: { 
			BBCText fromString: 'people' };
			yourself.
		BBCText fromString: ' '.
		BBCItalic new subnodes: { 
			BBCText fromString: 'how are you?' };
			yourself }.
	
	rootNode accept: exporter.
	
	self assert: exporter contents equals: 'Hello [b]people[/b] [i]how are you?[/i]'