"
I am a table content node for a bbcode AST.

I represent the syntax: '[td]{text}[/td]'.
"
Class {
	#name : #BBCTableContentCell,
	#superclass : #BBCTableCell,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCTableContentCell class >> tagName [
	^ 'td'
]

{ #category : #visiting }
BBCTableContentCell >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCTableContentCellNode: self
]
