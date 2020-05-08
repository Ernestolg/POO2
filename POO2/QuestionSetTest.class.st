Class {
	#name : #QuestionSetTest,
	#superclass : #TestCase,
	#instVars : [
		'topicsCollection',
		'testedUser',
		'aQuestion',
		'aReply'
	],
	#category : #'POO2-Test'
}

{ #category : #'setUp-tearDown' }
QuestionSetTest >> setUp [
	super setUp.
	topicsCollection :=OrderedCollection new.
	topicsCollection add: (Topic create: 'example' withDescription:'example') .
	testedUser:=(User create: 'Tester' withPassword:'123' ).
   aQuestion :=testedUser
		askQuestion: 'What I need to write some tests?'
		withText: 'I need help. IDK how to start'
		withTopics: topicsCollection.
	aReply:=testedUser replyQuestion:aQuestion withText:'Nope'.
]

{ #category : #'setUp-tearDown' }
QuestionSetTest >> tearDown [ 
	super tearDown 
]

{ #category : #'setUp-tearDown' }
QuestionSetTest >> testAddToTopics [
	| topicAux |
	topicAux := Topic create: 'new Topic' withDescription: 'new'.
	topicsCollection add: topicAux.
	self assert: topicsCollection first questions size equals: 1.
	self assert: topicsCollection second questions size equals: 0.
	aQuestion addToTopics: topicsCollection.
	self assert: topicsCollection first questions size equals: 2.
	self assert: topicsCollection second questions size equals: 1.
	self
		assert:
			(topicsCollection first questions
				anySatisfy: [ :each | each title = aQuestion title ]).
	self
		assert:
			(topicsCollection second questions
				anySatisfy: [ :each | each title = aQuestion title ])
]

{ #category : #'setUp-tearDown' }
QuestionSetTest >> testImFromUser [
	|testedUser2|
		testedUser2:= User create: 'Alfonso' withPassword:'Alfongod'.
		self assert: (aQuestion imFromUser: testedUser) .
		self deny:(aQuestion imFromUser:testedUser2 )	
]

{ #category : #'setUp-tearDown' }
QuestionSetTest >> testMyRepliesSorted [
	|anotherReply testedUser2|
	testedUser2:=User create: 'Ernest' withPassword:'564'. 
	anotherReply:=testedUser replyQuestion:aQuestion withText:'pepe'.
	testedUser2 like:anotherReply.
	self assert: aQuestion myRepliesSorted first text equals: anotherReply text.
	testedUser2 dislike:anotherReply.
	self assert: aQuestion myRepliesSorted first text equals: aReply text.
	
]

{ #category : #'setUp-tearDown' }
QuestionSetTest >> testRemoves [
	"testeo las partes del RemoveMe para asegurarme que funcionen"

	self assert: topicsCollection first questions size equals: 1.
	self assert: testedUser replies size equals: 1.
	self assert: aQuestion replies size equals: 1.
	aQuestion removeReplies.
	self assert: aQuestion replies size equals: 0.
	self assert: testedUser replies size equals: 0.
	aQuestion removeFromTopic.
	self assert: topicsCollection first questions size equals: 0
]
