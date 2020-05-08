Class {
	#name : #ReplySetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser',
		'aQuestion',
		'aReply'
	],
	#category : #'POO2-Test'
}

{ #category : #'setUp-tearDown' }
ReplySetTest >> setUp [
	| topicCollection |
	super setUp.
	topicCollection := OrderedCollection new.
	topicCollection
		add: (Topic create: 'Example' withDescription: 'Just testing').
	testedUser := User create: 'test' withPassword: 'Unicorn'.
	aQuestion := testedUser
		askQuestion: 'Does unicorn exist?'
		withText: 'i need 2 know'
		withTopics: topicCollection.
	aReply:=testedUser replyQuestion: aQuestion withText: 'I HOPE SO'
]

{ #category : #'setUp-tearDown' }
ReplySetTest >> tearDown [ 
	super tearDown 
]

{ #category : #'setUp-tearDown' }
ReplySetTest >> testPointsWithoutUser [
	|anotherUser|
	self assert: aReply pointsWithoutUser equals:0.
	anotherUser:=User create: 'Pedrito' withPassword:'123'.
	aReply:=anotherUser replyQuestion: aQuestion withText:'They dont exist'.
	self assert: aReply pointsWithoutUser equals:50.

]

{ #category : #'setUp-tearDown' }
ReplySetTest >> testRemoveFromUser [
	self assert: testedUser replies size equals:1.
	aReply removeFromUser.
	self assert: testedUser replies size equals:0.

]
