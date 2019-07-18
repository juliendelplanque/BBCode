instance creation
parseStream: aReadStream
	^ self new
		content: (aReadStream upTo: $]);
		yourself