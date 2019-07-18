"
I am a table row node for a bbcode AST.

I represent the syntax: '[tr]{table cells}[/tr]'.
"
Class {
	#name : #BBCTableRow,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCTableRow class >> tagName [
	^ 'tr'
]

{ #category : #visiting }
BBCTableRow >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCTableRowNode: self
]
