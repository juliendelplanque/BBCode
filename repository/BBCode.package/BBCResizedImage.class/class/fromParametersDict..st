instance creation
fromParametersDict: aDictionary
	^ self new
		height: (aDictionary at: 'HEIGHT');
		width: (aDictionary at: 'WIDTH');
		yourself