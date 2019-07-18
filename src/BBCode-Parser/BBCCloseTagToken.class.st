"
I am a close tag token. For example: '[/b]'.
"
Class {
	#name : #BBCCloseTagToken,
	#superclass : #BBCTagToken,
	#category : 'BBCode-Parser-Tokens'
}

{ #category : #'instance creation' }
BBCCloseTagToken class >> parseStream: aReadStream [
	aReadStream next.
	^ self new
		content: (aReadStream upTo: $]);
		yourself
]

{ #category : #testing }
BBCCloseTagToken >> isCloseTag [
	^ true
]

{ #category : #'private - parsing' }
BBCCloseTagToken >> parseTag: aString [
	self tag: aString trimmed
]
