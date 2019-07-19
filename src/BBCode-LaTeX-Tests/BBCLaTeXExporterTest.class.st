"
A BBCLatexExporterTest is a test class for testing the behavior of BBCLatexExporter
"
Class {
	#name : #BBCLaTeXExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter'
	],
	#category : #'BBCode-LaTeX-Tests'
}

{ #category : #running }
BBCLaTeXExporterTest >> setUp [
	super setUp.
	exporter := BBCLaTeXExporter on: (WriteStream on: String new).
	exporter lineEnding: String cr
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCBoldNode [
	| boldNode |
	boldNode := BBCBold new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	boldNode accept: exporter.
	
	self assert: exporter contents equals: '\textbf{hello you}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCCodeNode [
	| codeString codeNode |
	codeString := '	code conserving spaces, tabs
	and new lines.'.
	codeNode := BBCCode new
						addSubnode: (BBCText fromString: codeString);
						yourself.
	
	codeNode accept: exporter.
	
	self assert: exporter contents equals: '\texttt{',codeString,'}'.
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCFontColourNode [
	| fontColorNode |
	fontColorNode := (BBCFontColour fontColour: 'red')
							addSubnode: (BBCText fromString: 'hello');
							addSubnode: (BBCText fromString: ' you');
							yourself.
	
	fontColorNode accept: exporter.
	
	self assert: exporter contents equals: '\textcolor{red}{hello you}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCItalicNode [
	| italicNode |
	italicNode := BBCItalic new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	italicNode accept: exporter.
	
	self assert: exporter contents equals: '\textit{hello you}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCLinkNode [
	| linkNode |
	linkNode := BBCLink new
						addSubnode: (BBCText fromString: 'http://pharo.org');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '\href{http://pharo.org}{http://pharo.org}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCListItemNode [
	| listItemNode |
	listItemNode := BBCListItem new
						addSubnode: (BBCText fromString: 'hello');
						yourself.
	
	listItemNode accept: exporter.
	
	self assert: exporter contents equals: '\item hello'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCNamedLinkNode [
	| linkNode |
	linkNode := (BBCNamedLink url: 'http://pharo.org')
						addSubnode: (BBCText fromString: 'Pharo');
						yourself.
	
	linkNode accept: exporter.
	
	self assert: exporter contents equals: '\href{http://pharo.org}{Pharo}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCOrderedListNode [
	| listNode |
	listNode := BBCOrderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'); yourself);
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '\begin{enumerate}
\item hello
\end{enumerate}
'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCRootNode [
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
	
	self assert: exporter contents equals: 'Hello \textbf{people} \textit{how are you?}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCTextNode [
	| textNode |
	textNode := BBCText fromString: 'hello
you'.
	
	textNode accept: exporter.
	
	self assert: exporter contents equals: 'hello
you'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCUnderlineNode [
	| underlineNode |
	underlineNode := BBCUnderline new
						addSubnode: (BBCText fromString: 'hello');
						addSubnode: (BBCText fromString: ' you');
						yourself.
	
	underlineNode accept: exporter.
	
	self assert: exporter contents equals: '\underline{hello you}'
]

{ #category : #'tests-visiting' }
BBCLaTeXExporterTest >> testVisitBBCUnorderedListNode [
	| listNode |
	listNode := BBCUnorderedList new
							addSubnode: (BBCListItem new addSubnode: (BBCText fromString: 'hello'));
							yourself.
	
	listNode accept: exporter.
	
	self assert: exporter contents equals: '\begin{itemize}
\item hello
\end{itemize}
'
]
