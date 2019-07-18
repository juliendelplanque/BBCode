"
I am an abstract visitor for visitor that export the AST on a stream.
"
Class {
	#name : #BBCOnStreamExporter,
	#superclass : #BBCAbstractVisitor,
	#instVars : [
		'writeStream'
	],
	#category : 'BBCode-Visitors'
}

{ #category : #'instance creation' }
BBCOnStreamExporter class >> on: aWriteStream [
	^ self new
		writeStream: aWriteStream;
		yourself
]

{ #category : #accessing }
BBCOnStreamExporter >> contents [
	^ writeStream contents
]

{ #category : #accessing }
BBCOnStreamExporter >> writeStream [
	^ writeStream
]

{ #category : #accessing }
BBCOnStreamExporter >> writeStream: anObject [
	writeStream := anObject
]
