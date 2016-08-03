verification
verifyIsBBCode: aReadStream
	(aReadStream contents includesAll: #($[ $])) ifFalse: [ ^ BBCBadFormat signal: 'Not a bbcode string.' ].