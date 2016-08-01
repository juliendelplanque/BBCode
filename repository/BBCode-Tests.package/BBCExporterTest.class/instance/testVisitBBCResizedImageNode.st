tests-visiting
testVisitBBCResizedImageNode
	| imageNode |
	imageNode := BBCResizedImage new
						height: '400';
						width: '200';
						subnodes: {(BBCText fromString: 'http://pharo.org/files/pharo.png')};
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '[img HEIGHT="400" WIDTH="200"]http://pharo.org/files/pharo.png[/img]'