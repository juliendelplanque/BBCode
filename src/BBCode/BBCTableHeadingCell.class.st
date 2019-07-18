"
I am a table heading node for a bbcode AST.

I represent the syntax: '[th]{text}[/th]'.
"
Class {
	#name : #BBCTableHeadingCell,
	#superclass : #BBCTableCell,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCTableHeadingCell class >> tagName [
	^ 'th'
]

{ #category : #visiting }
BBCTableHeadingCell >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCTableHeadingCellNode: self
]
