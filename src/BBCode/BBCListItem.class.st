"
I am a list item node for a bbcode AST.

I represent the syntax: '[li]{text}[/li]'.
"
Class {
	#name : #BBCListItem,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCListItem class >> tagName [
	^ 'li'
]

{ #category : #visiting }
BBCListItem >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCListItemNode: self
]
