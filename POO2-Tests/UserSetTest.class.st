Class {
	#name : #UserSetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser',
		'testedUser2',
		'testedUser3',
		'aQuestion',
		'aReply',
		'aTopic',
		'topicsCollection'
	],
	#category : #'POO2-Tests'
}

{ #category : #'setUp-tearDown' }
UserSetTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	testedUser := User create: 'Testing' withPassword: 'pass'.
	testedUser2 := User create: 'Testing2' withPassword: 'pass'.
	testedUser3 := User create: 'Testing3' withPassword: 'pass'.
	testedUser follow: testedUser2.
	testedUser2 follow: testedUser3.
	testedUser3 follow: testedUser.
	
	topicsCollection := OrderedCollection new.
	aTopic := Topic create: 'Help' withDescription: 'General Topic'.
	topicsCollection add: aTopic.
	
	
	aQuestion := testedUser
		askQuestion: 'What I need to write some tests?'
		withText: 'I need help. IDK how to start'
		withTopics: topicsCollection .
	aReply := testedUser2
		replyQuestion: aQuestion
		withText: 'You have 2 read the documentation.'.
	testedUser like: aReply.
	testedUser3 dislike: aReply
]

{ #category : #'setUp-tearDown' }
UserSetTest >> tearDown [ 
	testedUser := nil.
	testedUser2 := nil.
	testedUser3 := nil.
	aReply := nil.
	aQuestion := nil.
	super tearDown.
]

{ #category : #tests }
UserSetTest >> testUserQuestions [
	self assert: testedUser questions size equals: 1.
]

{ #category : #tests }
UserSetTest >> testUserRelevantQuestions [
	
	aTopic := Topic create: 'Software Enginnering' withDescription: 'Agile methods'.
	testedUser addFavTopic: aTopic.
	topicsCollection := OrderedCollection new.
	topicsCollection add: aTopic.
	testedUser askQuestion: 'Kanban' withText: 'I need some information about this' withTopics: topicsCollection.
	
	aTopic := Topic create: 'Web development' withDescription: 'Technologies related with web development'.
	
	testedUser2 askQuestion: 'React vs Vue JS' withText: 'Which is better? I need some help here' withTopics: topicsCollection.
	
	self assert: (testedUser relevantQuestions size) identicalTo: 2.
]

{ #category : #tests }
UserSetTest >> testUserReplies [
	self assert:(testedUser2 replies size) identicalTo:1.
]

{ #category : #tests }
UserSetTest >> testUserScoring [
	"self assert:(testedUser2 score) identicalTo:20."
	self assert: testedUser2 replies size equals: 1.
	self assert: testedUser2 score equals: 2.
]
