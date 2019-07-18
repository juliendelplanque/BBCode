"
I am a table node for a bbcode AST.

I represent the syntax: '[table]{table rows}[/table]'.
"
Class {
	#name : #BBCTable,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCTable class >> tagName [
	^ 'table'
]

{ #category : #visiting }
BBCTable >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCTableNode: self
]
