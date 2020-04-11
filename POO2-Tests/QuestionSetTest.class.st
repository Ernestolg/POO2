Class {
	#name : #QuestionSetTest,
	#superclass : #TestCase,
	#instVars : [
		'topicsCollection',
		'testedUser',
		'aQuestion'
	],
	#category : #'POO2-Tests'
}

{ #category : #'setUp-tearDown' }
QuestionSetTest >> setUp [
	super setUp.
	topicsCollection add: topicsCollection first.
   aQuestion :=testedUser
		askQuestion: 'What I need to write some tests?'
		withText: 'I need help. IDK how to start'
		withTopics: topicsCollection.
]
