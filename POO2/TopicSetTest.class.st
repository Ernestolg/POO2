Class {
	#name : #TopicSetTest,
	#superclass : #TestCase,
	#instVars : [
		'topicsCollection'
	],
	#category : #'POO2-Test'
}

{ #category : #'setUp-tearDown' }
TopicSetTest >> setUp [
	super setUp.
	topicsCollection := OrderedCollection new.
	topicsCollection add: (Topic create: 'Help' withDescription: 'General Topic').
]
