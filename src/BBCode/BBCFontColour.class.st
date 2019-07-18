"
I am a font colour node for a bbcode AST.

I represent the syntax: '[color=red]{text}[/color]'.
"
Class {
	#name : #BBCFontColour,
	#superclass : #BBCSimpleParameterizedNode,
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCFontColour class >> fontColour: fontColour [
	^ self new
		fontColour: fontColour;
		yourself
]

{ #category : #accessing }
BBCFontColour class >> tagName [
	^ 'color'
]

{ #category : #visiting }
BBCFontColour >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCFontColourNode: self
]

{ #category : #accessing }
BBCFontColour >> fontColour [
	^ self parameter
]

{ #category : #accessing }
BBCFontColour >> fontColour: fontColour [
	self parameter: fontColour
]
