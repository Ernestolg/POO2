Class {
	#name : #PostSetTest,
	#superclass : #TestCase,
	#instVars : [
		'topicsCollection',
		'testedUser',
		'testedUser2',
		'aQuestion',
		'aReply'
	],
	#category : #'POO2-Test'
}

{ #category : #running }
PostSetTest >> setUp [ 	
	super setUp.
	topicsCollection :=OrderedCollection new.
	topicsCollection add: (Topic create: 'example' withDescription:'example') .
	testedUser:=(User create: 'Tester' withPassword:'123' ).
	testedUser2 :=(User create: 'Lester' withPassword:'321' ).
   aQuestion :=testedUser
		askQuestion: 'What I need to write some tests?'
		withText: 'I need help. IDK how to start'
		withTopics: topicsCollection.
	aReply:=testedUser replyQuestion:aQuestion withText:'Nope'.
]

{ #category : #running }
PostSetTest >> tearDown [ 	
	super tearDown
]

{ #category : #running }
PostSetTest >> testLikeDislike [
	self assert: aQuestion likes equals: 0.
	self assert: aQuestion dislikes equals: 0.
	testedUser like: aQuestion.
	testedUser2 dislike: aQuestion.
	self assert: aQuestion likes equals: 1.
	self assert: aQuestion dislikes equals: 1.
	testedUser dislike: aQuestion.
	self assert: aQuestion likes equals: 0.
	self assert: aQuestion dislikes equals: 2
]

{ #category : #running }
PostSetTest >> testRemoveInteraction [
	self assert: aQuestion interactions size equals:0.
	testedUser like:aQuestion.
	self assert: aQuestion interactions size equals:1.
	aQuestion removeInteraction: testedUser.
	self assert: aQuestion interactions size equals:0.
]

{ #category : #running }
PostSetTest >> testScore [
	self assert: aQuestion score equals: 0.
	testedUser2 like: aQuestion.
	testedUser like: aQuestion.
	self assert: aQuestion score equals: 2.
	testedUser2 dislike: aQuestion.
	self assert: aQuestion score equals: 0.
	testedUser dislike: aQuestion.
	self assert: aQuestion score equals: -2
]
