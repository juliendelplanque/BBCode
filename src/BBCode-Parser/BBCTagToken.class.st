"
I am an abstract token for tag tokens.
"
Class {
	#name : #BBCTagToken,
	#superclass : #BBCToken,
	#instVars : [
		'tag'
	],
	#category : 'BBCode-Parser-Tokens'
}

{ #category : #accessing }
BBCTagToken >> content: aString [
	super content: aString.
	self parseTag: self content
]

{ #category : #'private - parsing' }
BBCTagToken >> parseTag: aString [
	"Extract the tag and the eventual parameters from the #content inst. var."
	self subclassResponsibility
]

{ #category : #accessing }
BBCTagToken >> tag [
	^ tag
]

{ #category : #accessing }
BBCTagToken >> tag: anObject [
	tag := anObject
]
