"
I am a resized image node for a bbcode AST.

I represent the syntax: '[img WIDTH=""400"" HEIGHT=""200""]{url}[/img]'.
"
Class {
	#name : #BBCResizedImage,
	#superclass : #BBCComplexParameterizedNode,
	#instVars : [
		'width',
		'height'
	],
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCResizedImage class >> fromParametersDict: aDictionary [
	^ self new
		height: (aDictionary at: 'HEIGHT');
		width: (aDictionary at: 'WIDTH');
		yourself
]

{ #category : #accessing }
BBCResizedImage class >> tagName [
	^ BBCImage tagName
]

{ #category : #'as yet unclassified' }
BBCResizedImage >> accept: aBBCVisitor [
	^ aBBCVisitor visitBBCResizedImageNode: self
]

{ #category : #accessing }
BBCResizedImage >> height [
	^ height
]

{ #category : #accessing }
BBCResizedImage >> height: anObject [
	height := anObject
]

{ #category : #accessing }
BBCResizedImage >> width [
	^ width
]

{ #category : #accessing }
BBCResizedImage >> width: anObject [
	width := anObject
]
