instance creation
parseStream: aReadStream
	| instance |
	instance := self new
						content: (aReadStream upTo: $[);
						yourself.
	aReadStream peekBack = $[
		ifTrue: [ aReadStream back ].
	^ instance