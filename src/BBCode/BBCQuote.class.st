"
I am a quote node for a bbcode AST.

I represent the syntax: '[quote]{text}[/quote]'.
"
Class {
	#name : #BBCQuote,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCQuote class >> tagName [
	^ 'quote'
]

{ #category : #visiting }
BBCQuote >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCQuoteNode: self
]
