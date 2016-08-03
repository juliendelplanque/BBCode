parsing
parse: aReadStream
	| tokens |
	self verifyIsBBCode: aReadStream.
	tokens := self tokenize: aReadStream.
	self verifyTokens: tokens.
	^ tokens