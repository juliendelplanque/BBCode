"
I am an bold node for a bbcode AST.

I represent the syntax: '[b]{text}[/b]'.
"
Class {
	#name : #BBCBold,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCBold class >> tagName [
	^ 'b'
]

{ #category : #visiting }
BBCBold >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCBoldNode: self
]
