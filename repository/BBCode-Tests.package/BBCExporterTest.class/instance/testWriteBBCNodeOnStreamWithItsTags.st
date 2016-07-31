tests-helper
testWriteBBCNodeOnStreamWithItsTags
	| underlineNode |
	underlineNode := BBCUnderline new.
	
	exporter writeBBCNodeOnStreamWithItsTags: underlineNode.
	
	self assert: exporter contents equals: '[u][/u]'