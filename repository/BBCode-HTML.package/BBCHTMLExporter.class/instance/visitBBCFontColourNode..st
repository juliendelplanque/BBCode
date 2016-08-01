visiting
visitBBCFontColourNode: aBBCFontColourNode
	self writeBBCNodeOnHTMLStream: aBBCFontColourNode withTag: 'span' parameters: { 		'style' -> ('color:{1}' format: { aBBCFontColourNode parameter }) } asDictionary