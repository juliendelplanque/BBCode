tests-visiting
testVisitBBCLineThroughNode
	| lineThroughNode |
	lineThroughNode := BBCLineThrough new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	lineThroughNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="text-decoration:line-through">hello you</span>'