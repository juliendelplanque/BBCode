"
I am an abstract bbcode token.
"
Class {
	#name : #BBCToken,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : 'BBCode-Parser-Tokens'
}

{ #category : #'instance creation' }
BBCToken class >> parseStream: aReadStream [
	^ self subclassResponsibility
]

{ #category : #accessing }
BBCToken >> content [
	^ content
]

{ #category : #accessing }
BBCToken >> content: anObject [
	content := anObject
]

{ #category : #testing }
BBCToken >> isCloseTag [
	^ false
]

{ #category : #testing }
BBCToken >> isOpenTag [
	^ false
]

{ #category : #testing }
BBCToken >> isStringToken [
	^ false
]

{ #category : #printing }
BBCToken >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self content;
		<< $)
]
