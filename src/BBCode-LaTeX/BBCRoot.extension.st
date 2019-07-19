Extension { #name : #BBCRoot }

{ #category : #'*BBCode-LaTeX' }
BBCRoot >> asLaTeX [
	| exporter |
	exporter := BBCLaTeXExporter on: (WriteStream on: String new).
	self accept: exporter.
	^ exporter contents
]
