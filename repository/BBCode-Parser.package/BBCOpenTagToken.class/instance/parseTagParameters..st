private - parsing
parseTagParameters: tagStream
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