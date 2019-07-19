Class {
	#name : #BBCLaTeXExporter,
	#superclass : #BBCOnStreamExporter,
	#instVars : [
		'lineEnding'
	],
	#category : #'BBCode-LaTeX'
}

{ #category : #accessing }
BBCLaTeXExporter >> lineEnding [
	^ lineEnding ifNil: [ lineEnding := Smalltalk os lineEnding ]
]

{ #category : #accessing }
BBCLaTeXExporter >> lineEnding: anObject [
	lineEnding := anObject
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCBoldNode: aBBCBoldNode [
	self writeBBCNodeOnLaTeXStream: aBBCBoldNode withCommand: 'textbf'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCCodeNode: aBBCCodeNode [
	self writeBBCNodeOnLaTeXStream: aBBCCodeNode withCommand: 'texttt'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCFontColourNode: aBBCFontColourNode [
	writeStream nextPutAll: '\textcolor{'.
	writeStream nextPutAll: aBBCFontColourNode fontColour.
	writeStream nextPutAll: '}{'.
	aBBCFontColourNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream nextPut: $}.
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCFontSizeNode: aBBCFontSizeNode [
	self error: 'Changing font size is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCImageNode: aBBCImageNode [
	self error: 'Inserting image is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCItalicNode: aBBCItalicNode [
	self writeBBCNodeOnLaTeXStream: aBBCItalicNode withCommand: 'textit'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCLineThroughNode: aBBCLineThroughNode [
	self error: 'Line through is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCLinkNode: aBBCLinkNode [
	writeStream nextPutAll: '\href{'.
	aBBCLinkNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream nextPutAll: '}{'.
	aBBCLinkNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream nextPut: $}.
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCListItemNode: aBBCListItemNode [
	writeStream nextPutAll: '\item '.
	aBBCListItemNode subnodes do: [ :subnode | subnode accept: self ].
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCNamedLinkNode: aBBCNamedLinkNode [
	writeStream nextPutAll: '\href{'.
	writeStream nextPutAll: aBBCNamedLinkNode url.
	writeStream nextPutAll: '}{'.
	aBBCNamedLinkNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream nextPut: $}.
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCNamedQuoteNode: aBBCNamedQuoteNode [
	self error: 'Quoting is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCOrderedListNode: aBBCOrderedListNode [
	writeStream nextPutAll: '\begin{enumerate}'.
	writeStream nextPutAll: self lineEnding.
	aBBCOrderedListNode subnodes do: [ :subnode |
		subnode accept: self ] separatedBy: [ writeStream nextPutAll: self lineEnding ].
	writeStream nextPutAll: self lineEnding.
	writeStream nextPutAll: '\end{enumerate}'.
	writeStream nextPutAll: self lineEnding
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCQuoteNode: aBBCQuoteNode [
	self error: 'Quoting is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCResizedImageNode: aBBCResizedImageNode [
	self error: 'Resizing image is not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCRootNode: aBBCRootNode [
	[ aBBCRootNode subnodes do: [ :subnode |
			subnode accept: self ]
	] ensure: [ writeStream close ].
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCTableContentCellNode: aBBCTableContentCellNode [
	self error: 'Table are not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCTableHeadingCellNode: aBBCTableHeadingCellNode [
	self error: 'Table are not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCTableNode: aBBCTableNode [
	self error: 'Table are not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCTableRowNode: aBBCTableRowNode [
	self error: 'Table are not supported by LaTeX exporter.'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCTextNode: aBBCTextNode [
	writeStream nextPutAll: aBBCTextNode text
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCUnderlineNode: aBBCUnderlineNode [
	self writeBBCNodeOnLaTeXStream: aBBCUnderlineNode withCommand: 'underline'
]

{ #category : #visiting }
BBCLaTeXExporter >> visitBBCUnorderedListNode: aBBCUnorderedListNode [
	writeStream nextPutAll: '\begin{itemize}'.
	writeStream nextPutAll: self lineEnding.
	aBBCUnorderedListNode subnodes do: [ :subnode |
		subnode accept: self ] separatedBy: [ writeStream nextPutAll: self lineEnding ].
	writeStream nextPutAll: self lineEnding.
	writeStream nextPutAll: '\end{itemize}'.
	writeStream nextPutAll: self lineEnding
]

{ #category : #helpers }
BBCLaTeXExporter >> writeBBCNodeOnLaTeXStream: aBBCNode withCommand: aLatexCommand [
	self writeBBCNodeOnLaTeXStream: aBBCNode withCommand: aLatexCommand parameters: Dictionary new
]

{ #category : #helpers }
BBCLaTeXExporter >> writeBBCNodeOnLaTeXStream: aBBCNode withCommand: aLatexCommand parameters: aDictionary [
	writeStream
		nextPut: $\;
		nextPutAll: aLatexCommand.
	
	aDictionary ifNotEmpty: [ writeStream nextPut: $[ ].
	aDictionary associations do: [ :association |
		writeStream
			nextPutAll: association key;
			nextPut: $=;
			nextPutAll: association value
	] separatedBy: [ writeStream nextPut: $, ].
	aDictionary ifNotEmpty: [ writeStream nextPut: $] ].

	writeStream
		nextPut: ${.
	aBBCNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		nextPut: $}
]
