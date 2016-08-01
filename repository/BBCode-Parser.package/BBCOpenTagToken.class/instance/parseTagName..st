private - parsing
parseTagName: tagStream
	| writeStream |
	writeStream := WriteStream on: String new.
	[ tagStream atEnd or: [ {Character space . $=} includes: tagStream peek ] ]
		whileFalse: [ 
			writeStream << tagStream next ].
	self tag: writeStream contents.