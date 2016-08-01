tests-visiting
testVisitBBCTextNode
	| textNode |
	textNode := BBCText fromString: 'hello
you'.
	
	textNode accept: exporter.
	
	self assert: exporter contents equals: 'hello<br/>you'