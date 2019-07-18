"
I am an italic node for a bbcode AST.

I represent the syntax: '[i]{text}[/i]'.
"
Class {
	#name : #BBCItalic,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCItalic class >> tagName [
	^ 'i'
]

{ #category : #visiting }
BBCItalic >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCItalicNode: self
]
