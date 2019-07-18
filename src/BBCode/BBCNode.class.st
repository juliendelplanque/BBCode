"
I am an abstract node for a bbcode AST.
"
Class {
	#name : #BBCNode,
	#superclass : #Object,
	#instVars : [
		'father',
		'subnodes'
	],
	#category : 'BBCode-AST'
}

{ #category : #accessing }
BBCNode class >> tagName [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCNode >> accept: aBBCVisitor [
	^ self subclassResponsibility
]

{ #category : #adding }
BBCNode >> addSubnode: aBBCNode [
	self subnodes add: aBBCNode.
	aBBCNode father: self
]

{ #category : #accessing }
BBCNode >> father [
	^ father
]

{ #category : #accessing }
BBCNode >> father: anObject [
	father := anObject
]

{ #category : #initialization }
BBCNode >> initialize [
	super initialize.
	self subnodes: OrderedCollection new
]

{ #category : #accessing }
BBCNode >> subnodes [
	^ subnodes
]

{ #category : #accessing }
BBCNode >> subnodes: anObject [
	subnodes := anObject
]

{ #category : #accessing }
BBCNode >> tagName [
	^ self class tagName
]
