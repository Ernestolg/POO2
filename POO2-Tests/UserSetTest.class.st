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

{ #category : #'add/remove' }
UserSetTest >> addQuestions [
self addTopics .
topicsCollection add: topicsCollection second.	
	testedUser
		askQuestion: 'Kanban'
		withText: 'I need some information about this'
		withTopics: topicsCollection.
	topicsCollection add: topicsCollection third.	
	testedUser2
		askQuestion: 'React vs Vue JS'
		withText: 'Which is better? I need some help here'
		withTopics: topicsCollection
]

{ #category : #'add/remove' }
UserSetTest >> addTopics [
	topicsCollection := OrderedCollection new.
	topicsCollection
		add:
			(Topic create: 'Software Enginnering' withDescription: 'Agile methods').
	topicsCollection
		add:
			(Topic
				create: 'Web development'
				withDescription: 'Technologies related with web development').
	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	testedUser := User create: 'Testing' withPassword: 'pass'.
	testedUser2 := User create: 'Testing2' withPassword: 'pass'.
	testedUser3 := User create: 'Testing3' withPassword: 'pass'.

	
	
	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> tearDown [ 
	super tearDown.
]

{ #category : #tests }
UserSetTest >> testUserQuestions [
	self assert: testedUser questions size equals: 1.
	self assert: testedUser2 questions size equals: 0.
	self assert: testedUser3 questions size equals: 0.
]

{ #category : #tests }
UserSetTest >> testUserReactions [

	aTopic := Topic create: 'General' withDescription: 'General Topic'.
	topicsCollection := OrderedCollection new.
	topicsCollection add: aTopic.
	aQuestion := testedUser askQuestion: 'Which is the best strategy?' withText:'I need to manage this project' withTopics: topicsCollection.
	
	testedUser2 like: aQuestion.
	testedUser3 like: aQuestion.
	
	aReply := testedUser2 replyQuestion: aQuestion withText: 'I think this strategy is better'.
	testedUser like: aReply.
	
	aReply := testedUser3 replyQuestion: aQuestion withText: 'In my case, I think is this one.'.
	testedUser like: aReply.
	testedUser like: aReply.
	testedUser like: aReply.
	testedUser2 like: aReply.
	
	self deny: (aReply likes) identicalTo: 4.
	self assert: (aReply likes) identicalTo: 2.
	
	aReply := testedUser replyQuestion: aQuestion  withText: 'Great. Thanks guys'.
	testedUser3 like: aReply.
	testedUser2 like: aReply.
	
	aReply := testedUser2 replyQuestion: aQuestion withText: 'Nice :D Check both'.
	aReply := testedUser3 replyQuestion: aQuestion withText: 'Cool'.
	testedUser like: aReply.
	
	self assert: (aQuestion likes ) identicalTo: 2.


]

{ #category : #tests }
UserSetTest >> testUserRelevantQuestions [
	self assert: testedUser relevantQuestions size identicalTo: 0.
	self assert: testedUser2 relevantQuestions size identicalTo: 0.
	self assert: testedUser3 relevantQuestions size identicalTo: 1.

	self addQuestions  .	
	testedUser3 addFavTopic: topicsCollection first.
	testedUser3 addFavTopic: topicsCollection first.
	testedUser3 addFavTopic: topicsCollection second.
	testedUser3 follow: testedUser2.
	
	self assert: testedUser relevantQuestions size identicalTo: 1.
	self assert: testedUser3 relevantQuestions size identicalTo: 3.
]

{ #category : #tests }
UserSetTest >> testUserRemoveQuestion [

	topicsCollection := OrderedCollection new.
	aTopic := Topic create: 'Software Enginnering' withDescription: 'Agile methods and more stuff'.
	topicsCollection add: aTopic.
	
	aQuestion := testedUser askQuestion: 'Information about Agile'  withText: 'Books about Agile' withTopics: topicsCollection.
	 
	testedUser2 replyQuestion: aQuestion WithText: 'Read this book'. 
]

{ #category : #tests }
UserSetTest >> testUserReplies [
	self assert:(testedUser2 replies size) identicalTo:1.
]

{ #category : #tests }
UserSetTest >> testUserScoring [
	"self assert:(testedUser2 score) identicalTo:20."
	self assert: testedUser2 replies size equals: 1.
	self assert: testedUser2 questions size equals:0.
	self assert: testedUser2 score equals: 50.
	self addQuestions.
	(testedUser2 questions first) addInteraction: testedUser like:true.
	(testedUser2 questions first) addInteraction: testedUser2 like:true.
	(testedUser2 questions first) addInteraction: testedUser2 like:true.
	(testedUser2 questions first) addInteraction: testedUser3 like:true.	 
	self assert: testedUser2 score equals: 73.  

]
