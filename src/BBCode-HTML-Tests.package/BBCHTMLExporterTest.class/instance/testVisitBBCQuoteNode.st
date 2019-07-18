tests-visiting
testVisitBBCQuoteNode
	| quoteNode |
	quoteNode := BBCQuote new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	quoteNode accept: exporter.
	
	self assert: exporter contents equals: '<em>hello you</em>'