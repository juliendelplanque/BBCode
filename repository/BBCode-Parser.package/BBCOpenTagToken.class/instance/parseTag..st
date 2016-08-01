private - parsing
parseTag: aString
	| tagStream |
	tagStream := aString trimmed readStream.
	self
		parseTagName: tagStream;
		parseTagParameters: tagStream.