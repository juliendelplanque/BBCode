private - parsing
parseSimpleTagParameter: tagStream
	"Here is where we are in the parsing:
		'url=Pharo'
		     ^
	        here
	"
	simpleTagParameter := tagStream upToEnd ifEmpty: [ BBCBadFormat signal: 'Simple tag parameter can not be empty.' ].
	parametersDict := nil