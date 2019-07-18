"
I am a visitor that export the AST as bbcode.
"
Class {
	#name : #BBCExporter,
	#superclass : #BBCOnStreamExporter,
	#category : 'BBCode-Visitors'
}

{ #category : #visiting }
BBCExporter >> visitBBCBoldNode: aBBCBoldNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCBoldNode
]

{ #category : #visiting }
BBCExporter >> visitBBCCodeNode: aBBCCodeNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCCodeNode
]

{ #category : #visiting }
BBCExporter >> visitBBCFontColourNode: aBBCFontColourNode [
	self writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCFontColourNode
]

{ #category : #visiting }
BBCExporter >> visitBBCFontSizeNode: aBBCFontSizeNode [
	self writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCFontSizeNode
]

{ #category : #visiting }
BBCExporter >> visitBBCImageNode: aBBCImageNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCImageNode
]

{ #category : #visiting }
BBCExporter >> visitBBCItalicNode: aBBCItalicNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCItalicNode
]

{ #category : #visiting }
BBCExporter >> visitBBCLineThroughNode: aBBCLineThroughNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCLineThroughNode
]

{ #category : #visiting }
BBCExporter >> visitBBCLinkNode: aBBCLinkNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCLinkNode
]

{ #category : #visiting }
BBCExporter >> visitBBCListItemNode: aBBCListItemNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCListItemNode
]

{ #category : #visiting }
BBCExporter >> visitBBCNamedLinkNode: aBBCNamedLinkNode [
	self writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCNamedLinkNode
]

{ #category : #visiting }
BBCExporter >> visitBBCNamedQuoteNode: aBBCNamedQuoteNode [
	self writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCNamedQuoteNode
]

{ #category : #visiting }
BBCExporter >> visitBBCOrderedListNode: aBBCOrderedListNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCOrderedListNode
]

{ #category : #visiting }
BBCExporter >> visitBBCQuoteNode: aBBCQuoteNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCQuoteNode
]

{ #category : #visiting }
BBCExporter >> visitBBCResizedImageNode: aBBCResizedImageNode [
	writeStream
		<< $[;
		<< aBBCResizedImageNode tagName;
		space;
		<< 'HEIGHT="';
		<< aBBCResizedImageNode height;
		<< '" WIDTH="';
		<< aBBCResizedImageNode width;
		<< '"]'.

	aBBCResizedImageNode subnodes do: [ :subnode | subnode accept: self ].
	
	writeStream
		<< '[/';
		<< aBBCResizedImageNode tagName;
		<< $].
]

{ #category : #visiting }
BBCExporter >> visitBBCRootNode: aBBCRootNode [
	[ aBBCRootNode subnodes do: [ :subnode |
			subnode accept: self ]
	] ensure: [ writeStream close ]
]

{ #category : #visiting }
BBCExporter >> visitBBCTableContentCellNode: aBBCTableContentCellNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCTableContentCellNode
]

{ #category : #visiting }
BBCExporter >> visitBBCTableHeadingCellNode: aBBCTableHeadingCellNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCTableHeadingCellNode
]

{ #category : #visiting }
BBCExporter >> visitBBCTableNode: aBBCTableNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCTableNode
]

{ #category : #visiting }
BBCExporter >> visitBBCTableRowNode: aBBCTableRowNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCTableRowNode
]

{ #category : #visiting }
BBCExporter >> visitBBCTextNode: aBBCTextNode [
	writeStream << aBBCTextNode text
]

{ #category : #visiting }
BBCExporter >> visitBBCUnderlineNode: aBBCUnderlineNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCUnderlineNode
]

{ #category : #visiting }
BBCExporter >> visitBBCUnorderedListNode: aBBCUnorderedListNode [
	self writeBBCNodeOnStreamWithItsTags: aBBCUnorderedListNode
]

{ #category : #helper }
BBCExporter >> writeBBCNodeOnStreamWithItsTags: aBBCNode [
	writeStream
		<< $[;
		<< aBBCNode tagName;
		<< $].
	aBBCNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '[/';
		<< aBBCNode tagName;
		<< $].
]

{ #category : #helper }
BBCExporter >> writeBBCNodeWithSimpleParameterOnStreamWithItsTags: aBBCSimpleParameterizedNode [
	writeStream
		<< $[;
		<< aBBCSimpleParameterizedNode tagName;
		<< $=;
		<< aBBCSimpleParameterizedNode parameter;
		<< $].
	aBBCSimpleParameterizedNode subnodes do: [ :subnode | subnode accept: self ].
	writeStream
		<< '[/';
		<< aBBCSimpleParameterizedNode tagName;
		<< $].
]
