tests-verification
testVerifyTokens
	| tokens |
	tokens := tokenizer tokenize: '[i]Hello[/i]' readStream.
	tokenizer verifyTokens: tokens.
	
	tokens := tokenizer tokenize: '[i]Hello[i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.
	
	tokens := tokenizer tokenize: '[i]Hello[/i][/i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.
	
	tokens := tokenizer tokenize: 'Hello[/i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.