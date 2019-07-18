"
I am an open tag token. For example: '[b]'.
"
Class {
	#name : #BBCOpenTagToken,
	#superclass : #BBCTagToken,
	#instVars : [
		'simpleTagParameter',
		'parametersDict'
	],
	#category : 'BBCode-Parser-Tokens'
}

{ #category : #'instance creation' }
BBCOpenTagToken class >> parseStream: aReadStream [
	^ self new
		content: (aReadStream upTo: $]);
		yourself
]

{ #category : #testing }
BBCOpenTagToken >> hasParametersDict [
	^ parametersDict isNotNil
]

{ #category : #testing }
BBCOpenTagToken >> hasSimpleParameter [
	^ simpleTagParameter isNotNil
]

{ #category : #testing }
BBCOpenTagToken >> isOpenTag [
	^ true
]

{ #category : #accessing }
BBCOpenTagToken >> parametersDict [
	^ parametersDict
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseComplexTagParameterName: tagStream [
	| nameStream |
	nameStream := WriteStream on: String new.
	[ tagStream peek = $= ]
		whileFalse: [ nameStream << tagStream next ].
	
	^ nameStream contents ifEmpty: [ BBCBadFormat signal: 'Error complex parameter name can not be empty.' ]
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseComplexTagParameterValue: tagStream [
	| valueStream |
	tagStream next = $"
		ifFalse: [ BBCBadFormat signal: 'Tag''s complex parameter value is bad encoded.' ].
	valueStream := WriteStream on: String new.
	[ tagStream peek = $" ]
		whileFalse: [ valueStream << tagStream next ].
	
	tagStream next = $"
		ifFalse: [ BBCBadFormat signal: 'Tag''s complex parameter value is bad encoded.' ].
	
	^ valueStream contents
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseComplexTagParameters: tagStream [
	"Here is where we are in the parsing ('' represents double quotes):
		'img WIDTH=''400'' HEIGHT=''200'''
		     ^
	        here
	"
	| parameterName parameterValue |
	parametersDict := Dictionary new.
	[ tagStream atEnd ]
		whileFalse: [ 
			parameterName := self parseComplexTagParameterName: tagStream.
			tagStream next = $= ifFalse: [ BBCBadFormat signal: 'Tag parameters are bad formatted.' ].
			parameterValue := self parseComplexTagParameterValue: tagStream.
			parametersDict at: parameterName put: parameterValue.
			tagStream atEnd
				ifFalse: [ 
					tagStream next = Character space
						ifFalse: [ BBCBadFormat signal: 'At least one space is needed between tag''s parameters.' ].
					[ tagStream peek = Character space ]
						whileTrue: [ tagStream next ] ] ].
	simpleTagParameter := nil
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseSimpleTagParameter: tagStream [
	"Here is where we are in the parsing:
		'url=Pharo'
		     ^
	        here
	"
	simpleTagParameter := tagStream upToEnd ifEmpty: [ BBCBadFormat signal: 'Simple tag parameter can not be empty.' ].
	parametersDict := nil
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseTag: aString [
	| tagStream |
	tagStream := aString trimmed readStream.
	self
		parseTagName: tagStream;
		parseTagParameters: tagStream.
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseTagName: tagStream [
	| writeStream |
	writeStream := WriteStream on: String new.
	[ tagStream atEnd or: [ {Character space . $=} includes: tagStream peek ] ]
		whileFalse: [ 
			writeStream << tagStream next ].
	self tag: writeStream contents.
]

{ #category : #'private - parsing' }
BBCOpenTagToken >> parseTagParameters: tagStream [
	| nextChar |
	tagStream atEnd ifTrue: [ ^ self ]. "No parameter(s)."
	
	nextChar := tagStream next.
	nextChar = $=
		ifTrue: [ 
			self parseSimpleTagParameter: tagStream.
			^ self ].
	
	nextChar = Character space
		ifTrue: [
			self parseComplexTagParameters: tagStream.
			^ self ].
	
	BBCBadFormat signal: 'Unexpected error while parsing open tag.'
]

{ #category : #accessing }
BBCOpenTagToken >> simpleTagParameter [
	^ simpleTagParameter
]
