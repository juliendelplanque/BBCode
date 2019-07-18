tests-visiting
testVisitBBCResizedImageNode
	| imageNode |
	imageNode := BBCResizedImage new
						height: '400';
						width: '200';
						addSubnode: (BBCText fromString: 'http://pharo.org/files/pharo.png');
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '<img src="http://pharo.org/files/pharo.png" height="400" width="200"/>'