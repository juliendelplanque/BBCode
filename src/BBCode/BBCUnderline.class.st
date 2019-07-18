"
I am an underline node for a bbcode AST.

I represent the syntax: '[u]{text}[/u]'.
"
Class {
	#name : #BBCUnderline,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCUnderline class >> tagName [
	^ 'u'
]

{ #category : #visiting }
BBCUnderline >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCUnderlineNode: self
]
