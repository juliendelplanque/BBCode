"
I am a ordered list node for a bbcode AST.

I represent the syntax: '[ol]{list items}[/ol]'.
"
Class {
	#name : #BBCOrderedList,
	#superclass : #BBCList,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCOrderedList class >> tagName [
	^ 'ol'
]

{ #category : #visiting }
BBCOrderedList >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCOrderedListNode: self
]
