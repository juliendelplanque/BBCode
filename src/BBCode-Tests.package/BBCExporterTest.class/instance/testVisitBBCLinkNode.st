tests-visiting
testVisitBBCLinkNode
	| linkNode |
	linkNode := BBCLink new
						subnodes: {(BBCText fromString: 'http://pharo.org')};
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '[url]http://pharo.org[/url]'