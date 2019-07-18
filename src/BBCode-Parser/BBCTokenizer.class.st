"
I tokenize an input string stream by creating 3 types of tokens:
1. String token.
2. Open tag token.
3. Close tag token.
"
Class {
	#name : #BBCTokenizer,
	#superclass : #Object,
	#category : 'BBCode-Parser-Parser'
}

{ #category : #parsing }
BBCTokenizer >> parse: aReadStream [
	| tokens |
	(aReadStream contents includesAll: #($[ $])) ifFalse: [ ^ BBCBadFormat signal: 'Not a bbcode string.' ].
	tokens := self tokenize: aReadStream.
	self verifyTokens: tokens.
	^ tokens
]

{ #category : #parsing }
BBCTokenizer >> tokenize: aReadStream [
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
	^ tokens
]

{ #category : #verification }
BBCTokenizer >> verifyTokens: tokens [
	"Verify that all tags are opened/closed correctly."
	| stack |
	stack := Stack new.
	tokens do: [ :token |
		token isOpenTag
			ifTrue: [ stack push: token ].
		token isCloseTag
			ifTrue: [
				(stack isNotEmpty and: [ stack pop tag = token tag ])
					ifFalse: [ BBCBadFormat signal: 'Tags are not opened/closed correctly.' ] ] ].
	stack ifNotEmpty: [ BBCBadFormat signal: 'Tags are not opened/closed correctly.' ]
]
