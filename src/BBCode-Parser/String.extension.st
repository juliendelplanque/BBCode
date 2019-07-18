Extension { #name : #String }

{ #category : #'*BBCode-Parser' }
String >> parseBBCode [
	^ BBCParser new
		parse: self readStream
]
