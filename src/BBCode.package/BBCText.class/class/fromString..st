instance creation
fromString: aString
	^ self new
		text: aString asHTMLString;
		yourself