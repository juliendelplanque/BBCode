tests-visiting
testVisitBBCNamedLinkNode
	| linkNode |
	linkNode := (BBCNamedLink url: 'Pharo')
						subnodes: {(BBCText fromString: 'http://pharo.org')};
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '[url=Pharo]http://pharo.org[/url]'