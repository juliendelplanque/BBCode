"
I am a unordered list node for a bbcode AST.

I represent the syntax: '[ul]{list items}[/ul]'.
"
Class {
	#name : #BBCUnorderedList,
	#superclass : #BBCList,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCUnorderedList class >> tagName [
	^ 'ul'
]

{ #category : #visiting }
BBCUnorderedList >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCUnorderedListNode: self
]
