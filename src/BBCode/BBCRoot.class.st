"
I am the root node of a bbcode ast.
"
Class {
	#name : #BBCRoot,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCRoot class >> tagName [
	^ ''
]

{ #category : #visiting }
BBCRoot >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCRootNode: self
]
