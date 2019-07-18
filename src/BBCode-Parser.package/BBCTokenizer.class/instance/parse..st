parsing
parse: aReadStream
	| tokens |
	(aReadStream contents includesAll: #($[ $])) ifFalse: [ ^ BBCBadFormat signal: 'Not a bbcode string.' ].
	tokens := self tokenize: aReadStream.
	self verifyTokens: tokens.
	^ tokens