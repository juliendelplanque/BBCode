"
I represent a bbcode tag simply parameterized.

It looks like: '[tag={parameter}]{text}[/tag]'.
"
Class {
	#name : #BBCSimpleParameterizedNode,
	#superclass : #BBCNode,
	#instVars : [
		'parameter'
	],
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCSimpleParameterizedNode >> parameter [
	^ parameter
]

{ #category : #accessing }
BBCSimpleParameterizedNode >> parameter: anObject [
	parameter := anObject
]
