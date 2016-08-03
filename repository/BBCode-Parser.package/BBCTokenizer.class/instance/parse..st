parsing
parse: aReadStream
	| tokens |
	tokens := self tokenize: aReadStream.
	self verifyTokens: tokens.
	^ tokens