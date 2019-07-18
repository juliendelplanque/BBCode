"
I am a named link node for a bbcode AST.

I represent the syntax: '[url=Pharo]{url}[/url]'.
"
Class {
	#name : #BBCNamedLink,
	#superclass : #BBCSimpleParameterizedNode,
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCNamedLink class >> tagName [
	^ BBCLink tagName
]

{ #category : #'instance creation' }
BBCNamedLink class >> url: linkName [
	^ self new
		url: linkName;
		yourself
]

{ #category : #visiting }
BBCNamedLink >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCNamedLinkNode: self
]

{ #category : #accessing }
BBCNamedLink >> url [
	^ self parameter
]

{ #category : #accessing }
BBCNamedLink >> url: linkName [
	self parameter: linkName
]
