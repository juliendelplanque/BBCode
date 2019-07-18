*BBCode-Parser
classForTagName: aString
	(#(BBCNode BBCSimpleParameterizedNode BBCComplexParameterizedNode) includes: self name) ifFalse: [ self shouldNotImplement ].
	^ self allSubclasses detect: [ :class |
		[ class tagName = aString ]
			on: SubclassResponsibility do: [ false ] ]