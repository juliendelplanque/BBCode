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
				stack pop content = token content
					ifFalse: [ BBCBadFormat signal ] ] ].
	stack ifNotEmpty: [ BBCBadFormat signal ]