*BBCode-HTML
asHTML
	| exporter |
	exporter := BBCHTMLExporter on: (WriteStream on: String new).
	self accept: exporter.
	^ exporter contents