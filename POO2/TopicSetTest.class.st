Class {
	#name : #TopicSetTest,
	#superclass : #TestCase,
	#instVars : [
		'topicsCollection',
		'question'
	],
	#category : #'POO2-Test'
}

{ #category : #'setUp-tearDown' }
TopicSetTest >> setUp [
	super setUp.
	topicsCollection := OrderedCollection new.
	topicsCollection
		add: (Topic create: 'Help' withDescription: 'General Topic').
	question := Question
		create: 'test'
		withTopics: topicsCollection
		withText: 'question'
		withAuthor: (User create: 'Pepe' withPassword: '123')
]

{ #category : #'setUp-tearDown' }
TopicSetTest >> tearDown [ 		
	super tearDown 
]

{ #category : #'setUp-tearDown' }
TopicSetTest >> testAddRelevant [
	| collection |
	collection := OrderedCollection new.
	topicsCollection first addRelevant: collection.
	self
		assert: topicsCollection first questions size
		equals: collection size.
	self
		assert: topicsCollection first questions first title
		equals: collection first title
]

{ #category : #'setUp-tearDown' }
TopicSetTest >> testRemoveQuestion [
	| anotherQuestion |
	self assert: topicsCollection first questions size equals: 1.
	anotherQuestion := Question
		create: 'anotherQ'
		withTopics: topicsCollection
		withText: 'fake'
		withAuthor: (User create: 'Dobby' withPassword: 'DomesticElf').
	self assert: topicsCollection first questions size equals: 2.
	topicsCollection first removeQuestion: anotherQuestion.
	self
		assert: topicsCollection first questions first title
		equals: question title
]
