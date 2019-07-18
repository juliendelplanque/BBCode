"
I represent a bbcode tag complex parameterized.

It looks like: '[tag {key1}=""{parameter1}"" {key2}=""{parameter2}""]{text}[/tag]'.
"
Class {
	#name : #BBCComplexParameterizedNode,
	#superclass : #BBCNode,
	#category : 'BBCode-AST'
}

{ #category : #'instance creation' }
BBCComplexParameterizedNode class >> fromParametersDict: aDictionary [
	^ self subclassResponsibility
]
