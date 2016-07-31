parsing
parse: aReadStream
	| tokens |
	tokens := OrderedCollection new.
	[ aReadStream atEnd ]
		whileFalse: [ |nextChar| 
			nextChar := aReadStream peek.
			nextChar = $[
				ifTrue: [ 
					aReadStream next.
					aReadStream peek = $/
						ifTrue: [ tokens add: (BBCCloseTagToken parseStream: aReadStream) ]
						ifFalse: [ tokens add: (BBCOpenTagToken parseStream: aReadStream) ] ]
				ifFalse: [ tokens add: (BBCStringToken parseStream: aReadStream) ] ].
	self verifyTokens: tokens.
	^ tokens