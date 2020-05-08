Class {
	#name : #InteractionSetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser',
		'aQuestion',
		'testedUser2'
	],
	#category : #'POO2-Test'
}

{ #category : #'setUp-tearDown' }
InteractionSetTest >> setUp [
	| topicsCollection |
	super setUp.
	topicsCollection := OrderedCollection new.
	topicsCollection add: (Topic create: 'Math' withDescription: 'MATH').
	testedUser := User create: 'test' withPassword: '345'.
	testedUser2 := User create: 'test2' withPassword: '123'.
	aQuestion := testedUser
		askQuestion: '2+2?'
		withText: 'mathproblem'
		withTopics: topicsCollection
]

{ #category : #'setUp-tearDown' }
InteractionSetTest >> tearDown [ 
	super tearDown 
]

{ #category : #'setUp-tearDown' }
InteractionSetTest >> testInteractionExist [
	self assert: aQuestion interactions size equals:0.
	testedUser like:aQuestion.
	self assert:aQuestion interactions size equals:1.
	self deny:(aQuestion interactions first interactionExist:testedUser2).
	self assert:(aQuestion interactions first interactionExist: testedUser).
	
]
