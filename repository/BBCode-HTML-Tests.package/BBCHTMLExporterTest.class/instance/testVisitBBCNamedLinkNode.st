tests-visiting
testVisitBBCNamedLinkNode
	| linkNode |
	linkNode := (BBCNamedLink linkName: 'Pharo')
						addSubnode: (BBCText fromString: 'http://pharo.org');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '<a href="http://pharo.org">Pharo</a>'