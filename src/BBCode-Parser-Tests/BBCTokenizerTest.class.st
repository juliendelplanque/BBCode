"
A BBCTokenizerTest is a test class for testing the behavior of BBCTokenizer
"
Class {
	#name : #BBCTokenizerTest,
	#superclass : #TestCase,
	#instVars : [
		'tokenizer'
	],
	#category : 'BBCode-Parser-Tests'
}

{ #category : #running }
BBCTokenizerTest >> setUp [
	tokenizer := BBCTokenizer new.
]

{ #category : #'tests-parsing' }
BBCTokenizerTest >> testTokenize [
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
]

{ #category : #'tests-verification' }
BBCTokenizerTest >> testVerifyTokens [
	| tokens |
	tokens := tokenizer tokenize: '[i]Hello[/i]' readStream.
	tokenizer verifyTokens: tokens.
	
	tokens := tokenizer tokenize: '[i]Hello[i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.
	
	tokens := tokenizer tokenize: '[i]Hello[/i][/i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.
	
	tokens := tokenizer tokenize: 'Hello[/i]' readStream.
	self should: [ tokenizer verifyTokens: tokens ] raise: BBCBadFormat.
]
