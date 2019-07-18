tests-visiting
testVisitBBCImageNode
	| imageNode |
	imageNode := BBCImage new
						addSubnode: (BBCText fromString: 'http://pharo.org/files/pharo.png');
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '<img src="http://pharo.org/files/pharo.png"/>'