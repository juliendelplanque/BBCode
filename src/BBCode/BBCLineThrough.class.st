"
I am an line-through node for a bbcode AST.

I represent the syntax: '[s]{text}[/s]'.
"
Class {
	#name : #BBCLineThrough,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCLineThrough class >> tagName [
	^ 's'
]

{ #category : #visiting }
BBCLineThrough >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCLineThroughNode: self
]
