private - parsing
parseComplexTagParameters: tagStream
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