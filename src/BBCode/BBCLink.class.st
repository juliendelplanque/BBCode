"
I am a link node for a bbcode AST.

I represent the syntax: '[url]{url}[/url]'.
"
Class {
	#name : #BBCLink,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCLink class >> tagName [
	^ 'url'
]

{ #category : #visiting }
BBCLink >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCLinkNode: self
]
