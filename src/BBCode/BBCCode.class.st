"
I am an code node for a bbcode AST.

I represent the syntax: '[code]{text}[/code]'.
"
Class {
	#name : #BBCCode,
	#superclass : #BBCNode,
	#instVars : [
		'code'
	],
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCCode class >> tagName [
	^ 'code'
]

{ #category : #visiting }
BBCCode >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCCodeNode: self
]
