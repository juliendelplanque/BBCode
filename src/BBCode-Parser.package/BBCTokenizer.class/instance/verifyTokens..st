verification
verifyTokens: tokens
	"Verify that all tags are opened/closed correctly."
	| stack |
	stack := Stack new.
	tokens do: [ :token |
		token isOpenTag
			ifTrue: [ stack push: token ].
		token isCloseTag
			ifTrue: [
				(stack isNotEmpty and: [ stack pop tag = token tag ])
					ifFalse: [ BBCBadFormat signal: 'Tags are not opened/closed correctly.' ] ] ].
	stack ifNotEmpty: [ BBCBadFormat signal: 'Tags are not opened/closed correctly.' ]