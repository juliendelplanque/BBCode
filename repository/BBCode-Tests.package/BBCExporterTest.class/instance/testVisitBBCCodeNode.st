tests-visiting
testVisitBBCCodeNode
	| codeString codeNode |
	codeString := '	code conserving spaces, tabs
	and new lines.'.
	codeNode := BBCCode new
						subnodes: { BBCText fromString: codeString };
						yourself.
	
	codeNode accept: exporter.
	
	self assert: exporter contents equals: '[code]',codeString,'[/code]'.