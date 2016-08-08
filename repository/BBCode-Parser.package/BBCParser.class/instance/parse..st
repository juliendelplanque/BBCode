parsing
parse: aReadStream
	| tree |
	tree := self buildASTFromStream: aReadStream.
	self validateAST: tree.
	^ tree