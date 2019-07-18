tests-visiting
testVisitBBCNamedLinkNode
	| linkNode |
	linkNode := (BBCNamedLink url: 'http://pharo.org')
						addSubnode: (BBCText fromString: 'Pharo');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '<a href="http://pharo.org">Pharo</a>'