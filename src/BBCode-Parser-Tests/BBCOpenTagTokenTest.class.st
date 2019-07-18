"
A BBCOpenTagTokenTest is a test class for testing the behavior of BBCOpenTagToken
"
Class {
	#name : #BBCOpenTagTokenTest,
	#superclass : #TestCase,
	#instVars : [
		'token'
	],
	#category : 'BBCode-Parser-Tests'
}

{ #category : #running }
BBCOpenTagTokenTest >> setUp [
	token := BBCOpenTagToken new.
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseComplexTagParameterName [
	| name |
	name := token parseComplexTagParameterName: 'WIDTH="400" HEIGHT="200"' readStream.
	self assert: name equals: 'WIDTH'.
	
	self should: [ token parseComplexTagParameterName: '="400" HEIGHT="200"' readStream ] raise: BBCBadFormat
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseComplexTagParameterValue [
	| value |
	value := token parseComplexTagParameterValue: '"400" HEIGHT="200"' readStream.
	self assert: value equals: '400'.
	
	value := token parseComplexTagParameterValue: '"" HEIGHT="200"' readStream.
	self assert: value equals: ''
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseComplexTagParameters [
	token parseComplexTagParameters: 'WIDTH="400" HEIGHT="200"' readStream.
	self assert: token parametersDict size equals: 2.
	
	self assert: ((token parametersDict keys) includesAll: { 'WIDTH' . 'HEIGHT' }).
	
	self assert: (token parametersDict at: 'WIDTH') equals: '400'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '200'
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseSimpleTagParameter [
	token parseSimpleTagParameter: 'Pharo' readStream.
	
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	self should: [ token parseSimpleTagParameter: '' readStream ] raise: BBCBadFormat
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseTag [
	token parseTag: 'b'.
	self assert: token tag equals: 'b'.
	
	token parseTag: 'url=Pharo'.
	self assert: token tag equals: 'url'.
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	token parseTag: 'img HEIGHT="400" WIDTH="200"'.
	self assert: ((token parametersDict keys) includesAll: { 'WIDTH' . 'HEIGHT' }).
	self assert: (token parametersDict at: 'WIDTH') equals: '200'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '400'
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseTagName [
	token parseTagName: 'b' readStream.
	
	self assert: token tag equals: 'b'.
	
	token parseTagName: 'url=Pharo' readStream.
	
	self assert: token tag equals: 'url'.
	
	token parseTagName: 'img WIDTH="400" HEIGHT="400"' readStream.
	
	self assert: token tag equals: 'img'
]

{ #category : #'tests-private - parsing' }
BBCOpenTagTokenTest >> testParseTagParameters [
	token parseTagParameters: '=Pharo' readStream.
	
	self assert: token parametersDict isNil.
	self assert: token simpleTagParameter equals: 'Pharo'.
	
	token parseTagParameters: ' WIDTH="400" HEIGHT="200"' readStream.
	
	self assert: token simpleTagParameter isNil.
	self assert: (token parametersDict keys includesAll: { 'WIDTH' . 'HEIGHT' }).
	self assert: (token parametersDict at: 'WIDTH') equals: '400'.
	self assert: (token parametersDict at: 'HEIGHT') equals: '200'
]
