"
I am a visitor that export the AST as html.
"
Class {
	#name : #BBCHTMLExporter,
	#superclass : #BBCOnStreamExporter,
	#category : 'BBCode-HTML'
}

{ #category : #visiting }
BBCHTMLExporter >> visitBBCBoldNode: aBBCBoldNode [
	self writeBBCNodeOnHTMLStream: aBBCBoldNode withTag: 'b'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCCodeNode: aBBCCodeNode [
	self writeBBCNodeOnHTMLStream: aBBCCodeNode withTag: 'code'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCFontColourNode: aBBCFontColourNode [
	self writeBBCNodeOnHTMLStream: aBBCFontColourNode withTag: 'span' parameters: { 		'style' -> ('color:{1}' format: { aBBCFontColourNode parameter }) } asDictionary
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCFontSizeNode: aBBCFontSizeNode [
	self writeBBCNodeOnHTMLStream: aBBCFontSizeNode withTag: 'span' parameters: { 		'style' -> ('font-size:{1}px' format: { aBBCFontSizeNode parameter }) } asDictionary
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCImageNode: aBBCImageNode [
	writeStream
		<< $<;
		<< 'img';
		space;
		<< 'src="';
		<< aBBCImageNode subnodes first text;
		<< '"';
		<< '/>'.
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCItalicNode: aBBCItalicNode [
	self writeBBCNodeOnHTMLStream: aBBCItalicNode withTag: 'i'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCLineThroughNode: aBBCLineThroughNode [
	self writeBBCNodeOnHTMLStream: aBBCLineThroughNode withTag: 'span' parameters: { 'style' -> 'text-decoration:line-through' } asDictionary
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCLinkNode: aBBCLinkNode [
	self writeBBCNodeOnHTMLStream: aBBCLinkNode withTag: 'a' parameters: { 'href' -> aBBCLinkNode subnodes first text } asDictionary
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCListItemNode: aBBCListItemNode [
	self writeBBCNodeOnHTMLStream: aBBCListItemNode withTag: 'li'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCNamedLinkNode: aBBCNamedLinkNode [
	writeStream
		<< '<a href="';
		<< aBBCNamedLinkNode url;
		<< '">';
		<< aBBCNamedLinkNode subnodes first text;
		<< '</a>'.
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCNamedQuoteNode: aBBCNamedQuoteNode [
	self writeBBCNodeOnHTMLStream: aBBCNamedQuoteNode withTag: 'em'.
	writeStream
		<< ' - ';
		<< aBBCNamedQuoteNode quoteName
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCOrderedListNode: aBBCOrderedListNode [
	self writeBBCNodeOnHTMLStream: aBBCOrderedListNode withTag: 'ol'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCQuoteNode: aBBCQuoteNode [
	self writeBBCNodeOnHTMLStream: aBBCQuoteNode withTag: 'em'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCResizedImageNode: aBBCResizedImageNode [
	writeStream
		<< $<;
		<< 'img';
		space;
		<< 'src="';
		<< aBBCResizedImageNode subnodes first text;
		<< '" height="';
		<< aBBCResizedImageNode height;
		<< '" width="';
		<< aBBCResizedImageNode width;
		<< '"/>'.
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCRootNode: aBBCRootNode [
	[ aBBCRootNode subnodes do: [ :subnode |
			subnode accept: self ]
	] ensure: [ writeStream close ].
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCTableContentCellNode: aBBCTableContentCellNode [
	self writeBBCNodeOnHTMLStream: aBBCTableContentCellNode withTag: 'td'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCTableHeadingCellNode: aBBCTableHeadingCellNode [
	self writeBBCNodeOnHTMLStream: aBBCTableHeadingCellNode withTag: 'th'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCTableNode: aBBCTableNode [
	self writeBBCNodeOnHTMLStream: aBBCTableNode withTag: 'table'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCTableRowNode: aBBCTableRowNode [
	self writeBBCNodeOnHTMLStream: aBBCTableRowNode withTag: 'tr'
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCTextNode: aBBCTextNode [
	aBBCTextNode father class = BBCCode
		ifTrue: [ 
			writeStream << aBBCTextNode text.
			^ self ].
	writeStream
		<< (String streamContents: [ :stream |
				|lines|
				lines := aBBCTextNode text lines.
				stream << lines first.
				lines allButFirstDo: [ :line |
					stream
						<< '<br/>';
						<< line ] ])
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCUnderlineNode: aBBCUnderlineNode [
	self writeBBCNodeOnHTMLStream: aBBCUnderlineNode withTag: 'span' parameters: { 'style' -> 'text-decoration:underline' } asDictionary
]

{ #category : #visiting }
BBCHTMLExporter >> visitBBCUnorderedListNode: aBBCUnorderedListNode [
	self writeBBCNodeOnHTMLStream: aBBCUnorderedListNode withTag: 'ul'
]

{ #category : #helper }
BBCHTMLExporter >> writeBBCNodeOnHTMLStream: aBBCNode withTag: anHTMLTag [
	self writeBBCNodeOnHTMLStream: aBBCNode withTag: anHTMLTag parameters: Dictionary new
]

{ #category : #helper }
BBCHTMLExporter >> writeBBCNodeOnHTMLStream: aBBCNode withTag: anHTMLTag parameters: aDictionary [
	writeStream
		<< $<;
		<< anHTMLTag.
	aDictionary keysAndValuesDo: [ :key :value |
		writeStream
			space;
			<< key;
			<< '="';
			<< value;
			<< $"
	].
	writeStream
		<< $>.
	aBBCNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '</';
		<< anHTMLTag;
		<< $>.
]
