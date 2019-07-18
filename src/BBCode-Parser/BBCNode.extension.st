Extension { #name : #BBCNode }

{ #category : #'*BBCode-Parser' }
BBCNode classSide >> classForTagName: aString [
	(#(BBCNode BBCSimpleParameterizedNode BBCComplexParameterizedNode) includes: self name) ifFalse: [ self shouldNotImplement ].
	^ self allSubclasses detect: [ :class |
		[ class tagName = aString ]
			on: SubclassResponsibility do: [ false ] ]
]
