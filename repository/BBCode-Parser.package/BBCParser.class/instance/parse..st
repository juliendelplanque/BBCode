parsing
parse: aReadStream
	| tokens rootNode currentNode |
	tokens := super parse: aReadStream.
	rootNode := BBCRoot new.
	currentNode := rootNode.
	tokens do: [ :token |
		token isStringToken
			ifTrue: [ currentNode addSubnode: (BBCText fromString: token content) ].
		token isOpenTag
			ifTrue: [ |oldCurrentNode|
				oldCurrentNode := currentNode.
				currentNode := (BBCNode classForTagName: token tag) new.
				token hasSimpleParameter ifTrue: [ 
					currentNode := (BBCSimpleParameterizedNode classForTagName: token tag) new.
					currentNode parameter: token simpleTagParameter ].
				token hasParametersDict ifTrue: [ 
					self halt. "todo" ].
				oldCurrentNode addSubnode: currentNode ].
		token isCloseTag
			ifTrue: [ currentNode := currentNode father ] ].
	^ rootNode