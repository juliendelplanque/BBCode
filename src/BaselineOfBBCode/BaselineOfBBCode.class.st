Class {
	#name : #BaselineOfBBCode,
	#superclass : #BaselineOf,
	#category : 'BaselineOfBBCode'
}

{ #category : #baseline }
BaselineOfBBCode >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec blessing: #baseline.
		spec
			package: 'BBCode';
			package: 'BBCode-Tests' with: [ spec requires: 'BBCode' ];
			package: 'BBCode-Parser' with: [ spec requires: 'BBCode' ];
			package: 'BBCode-Parser-Tests' with: [ spec requires: 'BBCode-Parser' ];
			package: 'BBCode-HTML' with: [ spec requires: 'BBCode' ];
			package: 'BBCode-HTML-Tests' with: [ spec requires: 'BBCode-HTML' ];
			package: 'BBCode-LaTeX' with: [ spec requires: 'BBCode' ];
			package: 'BBCode-LaTeX-Tests' with: [ spec requires: 'BBCode-LaTeX' ].

		spec
			group: 'core' with: #('BBCode');
			group: 'parser' with: #('core' 'BBCode-Parser');
			group: 'html' with: #('core' 'parser' 'BBCode-HTML');
			group: 'latex' with: #('core' 'parser' 'BBCode-LaTeX') ]
]
