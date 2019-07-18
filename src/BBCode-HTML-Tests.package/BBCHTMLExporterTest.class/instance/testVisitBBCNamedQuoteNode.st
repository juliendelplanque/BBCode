tests-visiting
testVisitBBCNamedQuoteNode
	| namedQuoteNode |
	namedQuoteNode := (BBCNamedQuote quoteName: 'John')
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	namedQuoteNode accept: exporter.
	
	self assert: exporter contents equals: '<em>hello you</em> - John'