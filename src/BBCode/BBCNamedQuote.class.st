"
I am a named quote node for a bbcode AST.

I represent the syntax: '[quote=John]{text}[/quote]'.
"
Class {
	#name : #BBCNamedQuote,
	#superclass : #BBCSimpleParameterizedNode,
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCNamedQuote class >> quoteName: quoteName [
	^ self new
		quoteName: quoteName;
		yourself
]

{ #category : #accessing }
BBCNamedQuote class >> tagName [
	^ BBCQuote tagName
]

{ #category : #visiting }
BBCNamedQuote >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCNamedQuoteNode: self
]

{ #category : #accessing }
BBCNamedQuote >> quoteName [
	"Wrap #parameter in an accessor with a name in relation with the parameter purpose."
	^ self parameter
]

{ #category : #accessing }
BBCNamedQuote >> quoteName: quoteName [
	"Wrap #parameter in an mutator with a name in relation with the parameter purpose."
	self parameter: quoteName
]
