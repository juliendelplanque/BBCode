tests-visiting
testVisitBBCImageNode
	| imageNode |
	imageNode := BBCImage new
						subnodes: {(BBCText fromString: 'http://pharo.org/files/pharo.png')};
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '[img]http://pharo.org/files/pharo.png[/img]'