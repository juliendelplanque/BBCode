tests-visiting
testVisitBBCLineThroughNode
	| lineThroughNode |
	lineThroughNode := BBCLineThrough new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	lineThroughNode accept: exporter.
	
	self assert: exporter contents equals: '[s]hello you[/s]'