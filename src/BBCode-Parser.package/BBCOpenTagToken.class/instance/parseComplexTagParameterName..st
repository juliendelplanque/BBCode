private - parsing
parseComplexTagParameterName: tagStream
	| nameStream |
	nameStream := WriteStream on: String new.
	[ tagStream peek = $= ]
		whileFalse: [ nameStream << tagStream next ].
	
	^ nameStream contents ifEmpty: [ BBCBadFormat signal: 'Error complex parameter name can not be empty.' ]