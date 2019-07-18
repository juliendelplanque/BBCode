tests-visiting
testVisitBBCTextNode
	| textNode |
	textNode := BBCText fromString: 'hello'.
	
	textNode accept: exporter.
	
	self assert: exporter contents equals: 'hello'