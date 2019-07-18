"
I am an bold node for a bbcode AST.

I represent the syntax: '{text}' (no tag).
"
Class {
	#name : #BBCText,
	#superclass : #BBCNode,
	#instVars : [
		'text'
	],
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCText class >> fromString: aString [
	^ self new
		text: aString asHTMLString;
		yourself
]

{ #category : #accessing }
BBCText class >> tagName [
	^ ''
]

{ #category : #visiting }
BBCText >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCTextNode: self
]

{ #category : #accessing }
BBCText >> subnodes [
	"No subnodes for a text node."
	^ {}
]

{ #category : #accessing }
BBCText >> text [
	^ text
]

{ #category : #accessing }
BBCText >> text: anObject [
	text := anObject
]
