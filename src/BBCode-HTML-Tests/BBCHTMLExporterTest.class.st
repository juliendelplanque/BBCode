"
A BBCHTMLExporterTest is a test class for testing the behavior of BBCHTMLExporter
"
Class {
	#name : #BBCHTMLExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter'
	],
	#category : 'BBCode-HTML-Tests'
}

{ #category : #running }
BBCHTMLExporterTest >> setUp [
	exporter := BBCHTMLExporter on: (WriteStream on: String new)
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCBoldNode [
	| boldNode |
	boldNode := BBCBold new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	boldNode accept: exporter.
	
	self assert: exporter contents equals: '<b>hello you</b>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCCodeNode [
	| codeString codeNode |
	codeString := '	code conserving spaces, tabs
	and new lines.'.
	codeNode := BBCCode new
						addSubnode: (BBCText fromString: codeString);
						yourself.
	
	codeNode accept: exporter.
	
	self assert: exporter contents equals: '<code>',codeString,'</code>'.
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCFontColourNode [
	| fontColorNode |
	fontColorNode := (BBCFontColour fontColour: 'red')
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	fontColorNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="color:red">hello you</span>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCFontSizeNode [
	| fontSizeNode |
	fontSizeNode := (BBCFontSize fontSize: 10)
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	fontSizeNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="font-size:10px">hello you</span>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCImageNode [
	| imageNode |
	imageNode := BBCImage new
						addSubnode: (BBCText fromString: 'http://pharo.org/files/pharo.png');
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '<img src="http://pharo.org/files/pharo.png"/>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCItalicNode [
	| italicNode |
	italicNode := BBCItalic new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	italicNode accept: exporter.
	
	self assert: exporter contents equals: '<i>hello you</i>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCLineThroughNode [
	| lineThroughNode |
	lineThroughNode := BBCLineThrough new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	lineThroughNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="text-decoration:line-through">hello you</span>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCLinkNode [
	| linkNode |
	linkNode := BBCLink new
						addSubnode: (BBCText fromString: 'http://pharo.org');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '<a href="http://pharo.org">http://pharo.org</a>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCListItemNode [
	| listItemNode |
	listItemNode := BBCListItem new
						addSubnode: (BBCText fromString: 'hello');
						yourself.
	
	listItemNode accept: exporter.
	
	self assert: exporter contents equals: '<li>hello</li>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCNamedLinkNode [
	| linkNode |
	linkNode := (BBCNamedLink url: 'http://pharo.org')
						addSubnode: (BBCText fromString: 'Pharo');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '<a href="http://pharo.org">Pharo</a>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCNamedQuoteNode [
	| namedQuoteNode |
	namedQuoteNode := (BBCNamedQuote quoteName: 'John')
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	namedQuoteNode accept: exporter.
	
	self assert: exporter contents equals: '<em>hello you</em> - John'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCOrderedListNode [
	| listNode |
	listNode := BBCOrderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'); yourself);
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '<ol><li>hello</li></ol>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCQuoteNode [
	| quoteNode |
	quoteNode := BBCQuote new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	quoteNode accept: exporter.
	
	self assert: exporter contents equals: '<em>hello you</em>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCResizedImageNode [
	| imageNode |
	imageNode := BBCResizedImage new
						height: '400';
						width: '200';
						addSubnode: (BBCText fromString: 'http://pharo.org/files/pharo.png');
						yourself.
	
	imageNode accept: exporter.
	
	self assert: exporter contents equals: '<img src="http://pharo.org/files/pharo.png" height="400" width="200"/>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCRootNode [
	| rootNode |
	rootNode := BBCRoot new.
	rootNode
		addSubnode: (BBCText fromString: 'Hello ');
		addSubnode: (BBCBold new 
			addSubnode: (BBCText fromString: 'people');
			yourself);
		addSubnode: (BBCText fromString: ' ');
		addSubnode: (BBCItalic new 
			addSubnode: (BBCText fromString: 'how are you?');
			yourself).
	
	rootNode accept: exporter.
	
	self assert: exporter contents equals: 'Hello <b>people</b> <i>how are you?</i>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCTableContentCellNode [
	| contentCellNode |
	contentCellNode := BBCTableContentCell new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	contentCellNode accept: exporter.
	
	self assert: exporter contents equals: '<td>hello you</td>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCTableHeadingCellNode [
	| headingCellNode |
	headingCellNode := BBCTableHeadingCell new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	headingCellNode accept: exporter.
	
	self assert: exporter contents equals: '<th>hello you</th>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCTableNode [
	| tableNode |
	tableNode := BBCTable new.

	tableNode  
		addSubnode: (BBCTableRow new 
			addSubnode: (BBCTableHeadingCell new addSubnode: (BBCText fromString: 'hello'); yourself); yourself);
		addSubnode: (BBCTableRow new 
			addSubnode: (BBCTableContentCell new addSubnode: (BBCText fromString: 'you'); yourself); yourself).
	
	tableNode accept: exporter.
	
	self assert: exporter contents equals: '<table><tr><th>hello</th></tr><tr><td>you</td></tr></table>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCTableRowNode [
	| rowNode |
	rowNode := BBCTableRow new
						addSubnode: (BBCTableContentCell new addSubnode: (BBCText fromString: 'hello'));
						yourself.
	
	rowNode accept: exporter.
	
	self assert: exporter contents equals: '<tr><td>hello</td></tr>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCTextNode [
	| textNode |
	textNode := BBCText fromString: 'hello
you'.
	
	textNode accept: exporter.
	
	self assert: exporter contents equals: 'hello<br/>you'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCUnderlineNode [
	| underlineNode |
	underlineNode := BBCUnderline new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	underlineNode accept: exporter.
	
	self assert: exporter contents equals: '<span style="text-decoration:underline">hello you</span>'
]

{ #category : #'tests-visiting' }
BBCHTMLExporterTest >> testVisitBBCUnorderedListNode [
	| listNode |
	listNode := BBCUnorderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'));
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '<ul><li>hello</li></ul>'
]
