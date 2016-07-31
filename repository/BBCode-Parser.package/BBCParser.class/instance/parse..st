parsing
parse: aReadStream
	| tokens |
	tokens := super parse: aReadStream.
	self flag: #todo