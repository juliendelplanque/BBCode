"
I am an image node for a bbcode AST.

I represent the syntax: '[img]{url}[/img]'.
"
Class {
	#name : #BBCImage,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCImage class >> tagName [
	^ 'img'
]

{ #category : #visiting }
BBCImage >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCImageNode: self
]
