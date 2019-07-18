tests-visiting
testVisitBBCNamedQuoteNode
	| namedQuoteNode |
	namedQuoteNode := (BBCNamedQuote quoteName: 'John')
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	namedQuoteNode accept: exporter.
	
	self assert: exporter contents equals: '[quote=John]hello you[/quote]'