tests-visiting
testVisitBBCCodeNode
	| codeString codeNode |
	codeString := '	code conserving spaces, tabs
	and new lines.'.
	codeNode := BBCCode code: codeString.
	
	codeNode accept: exporter.
	
	self assert: exporter contents equals: '[code]',codeString,'[/code]'.