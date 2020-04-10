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
	self setUpUser.
	self setUpTopics.
	self setUpQuestions.
	self setUpReplies .
	self setUpInteractions .

	
	
	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUpInteractions [
	testedUser like: aReply.
	testedUser3 dislike: aReply

	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUpQuestions [
	topicsCollection add: topicsCollection first.
   aQuestion :=testedUser
		askQuestion: 'What I need to write some tests?'
		withText: 'I need help. IDK how to start'
		withTopics: topicsCollection.
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUpReplies [
		aReply := testedUser2
		replyQuestion: aQuestion
		withText: 'You have 2 read the documentation.'.

	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUpTopics [
	topicsCollection := OrderedCollection new.
	topicsCollection
		add: (Topic create: 'Help' withDescription: 'General Topic').
]

{ #category : #'setUp-tearDown' }
UserSetTest >> setUpUser [
	testedUser := User create: 'Testing' withPassword: 'pass'.
	testedUser2 := User create: 'Testing2' withPassword: 'pass'.
	testedUser3 := User create: 'Testing3' withPassword: 'pass'.
	testedUser follow:testedUser2.
	testedUser2 follow:testedUser3.
	testedUser3 follow:testedUser.
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
	self assert: testedUser2 questions size equals: 0.
	self assert: testedUser3 questions size equals: 0.
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
