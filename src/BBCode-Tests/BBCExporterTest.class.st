"
A BBCExporterTest is a test class for testing the behavior of BBCExporter
"
Class {
	#name : #BBCExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter'
	],
	#category : 'BBCode-Tests'
}

{ #category : #running }
BBCExporterTest >> setUp [
	exporter := BBCExporter on: (WriteStream on: String new)
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCBoldNode [
	| boldNode |
	boldNode := BBCBold new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	boldNode accept: exporter.
	
	self assert: exporter contents equals: '[b]hello you[/b]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCCodeNode [
	| codeString codeNode |
	codeString := '	code conserving spaces, tabs
	and new lines.'.
	codeNode := BBCCode new
						subnodes: { BBCText fromString: codeString };
						yourself.
	
	codeNode accept: exporter.
	
	self assert: exporter contents equals: '[code]',codeString,'[/code]'.
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCFontColourNode [
	| fontColorNode |
	fontColorNode := (BBCFontColour fontColour: 'red')
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	fontColorNode accept: exporter.
	
	self assert: exporter contents equals: '[color=red]hello you[/color]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCFontSizeNode [
	| fontSizeNode |
	fontSizeNode := (BBCFontSize fontSize: 10)
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	fontSizeNode accept: exporter.
	
	self assert: exporter contents equals: '[size=10]hello you[/size]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCImageNode [
	| imageNode |
	imageNode := BBCImage new
						subnodes: {(BBCText fromString: 'http://pharo.org/files/pharo.png')};
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '[img]http://pharo.org/files/pharo.png[/img]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCItalicNode [
	| italicNode |
	italicNode := BBCItalic new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	italicNode accept: exporter.
	
	self assert: exporter contents equals: '[i]hello you[/i]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCLineThroughNode [
	| lineThroughNode |
	lineThroughNode := BBCLineThrough new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	lineThroughNode accept: exporter.
	
	self assert: exporter contents equals: '[s]hello you[/s]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCLinkNode [
	| linkNode |
	linkNode := BBCLink new
						subnodes: {(BBCText fromString: 'http://pharo.org')};
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '[url]http://pharo.org[/url]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCListItemNode [
	| listItemNode |
	listItemNode := BBCListItem new
						subnodes: {(BBCText fromString: 'hello')};
						yourself.
	
	listItemNode accept: exporter.
	
	self assert: exporter contents equals: '[li]hello[/li]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCNamedLinkNode [
	| linkNode |
	linkNode := (BBCNamedLink url: 'Pharo')
						subnodes: {(BBCText fromString: 'http://pharo.org')};
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '[url=Pharo]http://pharo.org[/url]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCNamedQuoteNode [
	| namedQuoteNode |
	namedQuoteNode := (BBCNamedQuote quoteName: 'John')
							subnodes: {(BBCText fromString: 'hello').
											(BBCText fromString: ' you')};
							yourself.
	
	namedQuoteNode accept: exporter.
	
	self assert: exporter contents equals: '[quote=John]hello you[/quote]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCOrderedListNode [
	| listNode |
	listNode := BBCOrderedList new
							subnodes: {BBCListItem new subnodes: {(BBCText fromString: 'hello')}; yourself};
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '[ol][li]hello[/li][/ol]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCQuoteNode [
	| quoteNode |
	quoteNode := BBCQuote new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	quoteNode accept: exporter.
	
	self assert: exporter contents equals: '[quote]hello you[/quote]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCResizedImageNode [
	| imageNode |
	imageNode := BBCResizedImage new
						height: '400';
						width: '200';
						subnodes: {(BBCText fromString: 'http://pharo.org/files/pharo.png')};
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '[img HEIGHT="400" WIDTH="200"]http://pharo.org/files/pharo.png[/img]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCRootNode [
	| rootNode |
	rootNode := BBCRoot new.
	rootNode subnodes: {
		BBCText fromString: 'Hello '.
		BBCBold new subnodes: { 
			BBCText fromString: 'people' };
			yourself.
		BBCText fromString: ' '.
		BBCItalic new subnodes: { 
			BBCText fromString: 'how are you?' };
			yourself }.
	
	rootNode accept: exporter.
	
	self assert: exporter contents equals: 'Hello [b]people[/b] [i]how are you?[/i]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCTableContentCellNode [
	| contentCellNode |
	contentCellNode := BBCTableContentCell new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	contentCellNode accept: exporter.
	
	self assert: exporter contents equals: '[td]hello you[/td]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCTableHeadingCellNode [
	| headingCellNode |
	headingCellNode := BBCTableHeadingCell new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	headingCellNode accept: exporter.
	
	self assert: exporter contents equals: '[th]hello you[/th]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCTableNode [
	| tableNode |
	tableNode := BBCTable new.

	tableNode subnodes: { 
		BBCTableRow new subnodes: {
			BBCTableHeadingCell new subnodes: { BBCText fromString: 'hello' }; yourself
		}; yourself.
		BBCTableRow new subnodes: {
			BBCTableContentCell new subnodes: { BBCText fromString: 'you' }; yourself
		}; yourself. }.
	
	tableNode accept: exporter.
	
	self assert: exporter contents equals: '[table][tr][th]hello[/th][/tr][tr][td]you[/td][/tr][/table]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCTableRowNode [
	| rowNode |
	rowNode := BBCTableRow new
						subnodes: {BBCTableContentCell new subnodes: { (BBCText fromString: 'hello')}; yourself};
						yourself.
	
	rowNode accept: exporter.
	
	self assert: exporter contents equals: '[tr][td]hello[/td][/tr]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCTextNode [
	| textNode |
	textNode := BBCText fromString: 'hello'.
	
	textNode accept: exporter.
	
	self assert: exporter contents equals: 'hello'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCUnderlineNode [
	| underlineNode |
	underlineNode := BBCUnderline new
						subnodes: {(BBCText fromString: 'hello').
										(BBCText fromString: ' you')};
						yourself.
	
	underlineNode accept: exporter.
	
	self assert: exporter contents equals: '[u]hello you[/u]'
]

{ #category : #'tests-visiting' }
BBCExporterTest >> testVisitBBCUnorderedListNode [
	| listNode |
	listNode := BBCUnorderedList new
							subnodes: {BBCListItem new subnodes: {(BBCText fromString: 'hello')}; yourself};
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '[ul][li]hello[/li][/ul]'
]

{ #category : #'tests-helper' }
BBCExporterTest >> testWriteBBCNodeOnStreamWithItsTags [
	| underlineNode |
	underlineNode := BBCUnderline new.
	
	exporter writeBBCNodeOnStreamWithItsTags: underlineNode.
	
	self assert: exporter contents equals: '[u][/u]'
]
