visiting
visitBBCTextNode: aBBCTextNode
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