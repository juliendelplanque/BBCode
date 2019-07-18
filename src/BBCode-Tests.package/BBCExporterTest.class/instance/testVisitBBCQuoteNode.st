tests-visiting
testVisitBBCQuoteNode
	| quoteNode |
	quoteNode := BBCQuote new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	quoteNode accept: exporter.
	
	self assert: exporter contents equals: '[quote]hello you[/quote]'