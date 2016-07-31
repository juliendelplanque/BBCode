instance creation
parseStream: aReadStream
	| instance |
	instance := self new
						content: (aReadStream upTo: $[);
						yourself.
	aReadStream back.
	^ instance