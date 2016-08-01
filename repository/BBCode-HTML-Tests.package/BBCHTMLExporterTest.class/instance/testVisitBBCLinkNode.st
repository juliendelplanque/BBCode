tests-visiting
testVisitBBCLinkNode
	| linkNode |
	linkNode := BBCLink new
						addSubnode: (BBCText fromString: 'http://pharo.org');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '<a href="http://pharo.org">http://pharo.org</a>'