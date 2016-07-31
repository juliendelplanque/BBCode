instance creation
parseStream: aReadStream
	aReadStream next.
	^ self new
		content: (aReadStream upTo: $]);
		yourself