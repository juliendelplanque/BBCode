private - parsing
parseComplexTagParameterValue: tagStream
	| valueStream |
	tagStream next = $"
		ifFalse: [ BBCBadFormat signal: 'Tag''s complex parameter value is bad encoded.' ].
	valueStream := WriteStream on: String new.
	[ tagStream peek = $" ]
		whileFalse: [ valueStream << tagStream next ].
	
	tagStream next = $"
		ifFalse: [ BBCBadFormat signal: 'Tag''s complex parameter value is bad encoded.' ].
	
	^ valueStream contents