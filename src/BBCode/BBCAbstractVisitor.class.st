"
I am an abstract visitor for a BBC AST.
"
Class {
	#name : #BBCAbstractVisitor,
	#superclass : #Object,
	#category : 'BBCode-Visitors'
}

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCBoldNode: aBBCBoldNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCCodeNode: aBBCCodeNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCFontColourNode: aBBCFontColourNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCFontSizeNode: aBBCFontSizeNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCImageNode: aBBCImageNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCItalicNode: aBBCItalicNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCLineThroughNode: aBBCLineThroughNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCLinkNode: aBBCLinkNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCListItemNode: aBBCListItemNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCNamedLinkNode: aBBCNamedLinkNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCNamedQuoteNode: aBBCNamedQuoteNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCOrderedListNode: aBBCOrderedListNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCQuoteNode: aBBCQuoteNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCResizedImageNode: aBBCResizedImageNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCRootNode: aBBCRootNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCTableContentCellNode: aBBCTableContentCellNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCTableHeadingCellNode: aBBCTableHeadingCellNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCTableNode: aBBCTableNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCTableRowNode: aBBCTableRowNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCTextNode: aBBCTextNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCUnderlineNode: aBBCUnderlineNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
BBCAbstractVisitor >> visitBBCUnorderedListNode: aBBCUnorderedListNode [
	^ self subclassResponsibility
]
