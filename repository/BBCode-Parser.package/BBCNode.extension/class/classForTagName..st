*BBCode-Parser
classForTagName: aString
	(#(BBCNode BBCSimpleParameterizedNode) includes: self name) ifFalse: [ self shouldNotImplement ].
	^ self allSubclasses detect: [ :class |
		[ class tagName = aString ]
			on: SubclassResponsibility do: [ false ] ]