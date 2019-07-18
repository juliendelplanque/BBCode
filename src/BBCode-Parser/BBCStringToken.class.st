"
I am string token. For example: 'hello'.
"
Class {
	#name : #BBCStringToken,
	#superclass : #BBCToken,
	#category : 'BBCode-Parser-Tokens'
}

{ #category : #'instance creation' }
BBCStringToken class >> parseStream: aReadStream [
	| instance |
	instance := self new
						content: (aReadStream upTo: $[);
						yourself.
	aReadStream peekBack = $[
		ifTrue: [ aReadStream back ].
	^ instance
]

{ #category : #testing }
BBCStringToken >> isStringToken [
	^ true
]
