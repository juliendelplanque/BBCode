instance creation
parseStream: aReadStream
	| instance |
	instance := self new
						content: (aReadStream upTo: $[);
						yourself.
	aReadStream atEnd ifFalse: [ aReadStream back ].
	^ instance