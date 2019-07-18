tests-parsing
testTokenize
	| tokens |
	tokens := tokenizer tokenize: '[i]Hello[/i]' readStream.
	
	{ BBCOpenTagToken . BBCStringToken . BBCCloseTagToken } with: tokens do: [ :class :token |
		self assert: token class equals: class ].
	
	{ 'i' . 'Hello' . 'i' } with: tokens do: [ :content :token |
		self assert: token content equals: content ].
	
	tokens := tokenizer tokenize: '[url=Pharo]http://pharo.org[/url]' readStream.
	
	{ BBCOpenTagToken . BBCStringToken . BBCCloseTagToken } with: tokens do: [ :class :token |
		self assert: token class equals: class ].
	
	{ 'url=Pharo' . 'http://pharo.org' . 'url' } with: tokens do: [ :content :token |
		self assert: token content equals: content ].
	
	tokens := tokenizer tokenize: '[img HEIGHT="400" WIDTH="200"]http://pharo.org/img[/img]' readStream.
	
	{ BBCOpenTagToken . BBCStringToken . BBCCloseTagToken } with: tokens do: [ :class :token |
		self assert: token class equals: class ].
	
	{ 'img HEIGHT="400" WIDTH="200"' . 'http://pharo.org/img' . 'img' } with: tokens do: [ :content :token |
		self assert: token content equals: content ].