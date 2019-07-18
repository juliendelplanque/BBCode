"
I am a font size node for a bbcode AST.

I represent the syntax: '[size=10]{text}[/size]'.
"
Class {
	#name : #BBCFontSize,
	#superclass : #BBCSimpleParameterizedNode,
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCFontSize class >> fontSize: fontSize [
	^ self new
		fontSize: fontSize;
		yourself
]

{ #category : #accessing }
BBCFontSize class >> tagName [
	^ 'size'
]

{ #category : #visiting }
BBCFontSize >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCFontSizeNode: self
]

{ #category : #accessing }
BBCFontSize >> fontSize [
	"Wrap #parameter in an accessor with a name in relation with the parameter purpose."
	^ self parameter
]

{ #category : #accessing }
BBCFontSize >> fontSize: fontSize [
	"Wrap #parameter in an mutator with a name in relation with the parameter purpose."
	self parameter: fontSize
]
