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
	
	aTopic := Topic create: 'General' withDescription: 'General Topic'.
	topicsCollection := OrderedCollection new.
	topicsCollection add: aTopic.

	
	
	
]

{ #category : #'setUp-tearDown' }
UserSetTest >> tearDown [ 
	super tearDown.
]

{ #category : #tests }
UserSetTest >> testUserQuestions [

	aQuestion := testedUser askQuestion: 'Which is the best strategy?' withText:'I need to manage this project' withTopics: topicsCollection.
	
	aReply := testedUser2 replyQuestion: aQuestion withText: 'I think this strategy is better'.
	aReply := testedUser3 replyQuestion: aQuestion withText: 'In my case, I think is this one.'.
	aReply := testedUser replyQuestion: aQuestion  withText: 'Great. Thanks guys'.
	aReply := testedUser2 replyQuestion: aQuestion withText: 'Nice :D Check both'.
	aReply := testedUser3 replyQuestion: aQuestion withText: 'Cool'.
	
	self assert: (testedUser questions size) identicalTo: 1.
	self assert: (testedUser replies size) identicalTo: 1.
	self assert: (testedUser2 replies size) identicalTo:2.
	self assert: (testedUser3 replies size) identicalTo:2.

]

{ #category : #tests }
UserSetTest >> testUserReactions [

	aQuestion := testedUser askQuestion: 'Which is the best strategy?' withText:'I need to manage this project' withTopics: topicsCollection.
	
	testedUser2 like: aQuestion.
	testedUser3 like: aQuestion.
	
	self assert: (aQuestion likes) identicalTo: 2. 
	
	aReply := testedUser2 replyQuestion: aQuestion withText: 'I think this strategy is better'.
	testedUser like: aReply.
	
	aReply := testedUser3 replyQuestion: aQuestion withText: 'In my case, I think is this one.'.
	self assert: (aReply alreadyLiked: testedUser) identicalTo: false.
	testedUser like: aReply.
	testedUser like: aReply.
	
	self assert: (aReply alreadyLiked: testedUser) identicalTo: true.
	testedUser like: aReply.
	testedUser2 like: aReply.
	
	self deny: (aReply likes) identicalTo: 4.
	self assert: (aReply likes) identicalTo: 2.
	
	aReply := testedUser replyQuestion: aQuestion  withText: 'Great. Thanks guys'.
	testedUser3 like: aReply.
	testedUser2 like: aReply.
	
	aReply := testedUser2 replyQuestion: aQuestion withText: 'Nice :D Check both'.
	aReply := testedUser3 replyQuestion: aQuestion withText: 'Cool'.
	testedUser dislike: aReply.
	testedUser dislike: aReply.
	
	self assert: (aReply dislikes) identicalTo: 1.
	
	self assert: (aQuestion likes ) identicalTo: 2.


]

{ #category : #tests }
UserSetTest >> testUserRelevantQuestions [
	
	"First. Set testeduser 2 and 3 as followers of testeduser 1 "
	testedUser2 follow: testedUser.
	testedUser3 follow: testedUser.
	
	"Testeduser 1 ask a question about a something with a general Topic"
	aQuestion := testedUser askQuestion: 'Which is the best strategy?' withText:'I need to manage this project' withTopics: topicsCollection.	
		
	"Then, we add a new topic as favorite topic of testedUser 1. We rewrite the Topics collection"
	topicsCollection := OrderedCollection new.
	aTopic := Topic create: 'Software Techique' withDescription: 'Questions about different techniques applied to software project management'.
	topicsCollection add: aTopic.
	testedUser addFavTopic: aTopic.
	
	"Now, testedUser 1 ask a question about his favorite topic"
	aQuestion := testedUser askQuestion: 'I need info about Lean' withText: 'Someone already worked with Lean technique?'  withTopics: topicsCollection.
	

	self assert: (testedUser2 relevantQuestions size) identicalTo: 2.
	self assert: (testedUser relevantQuestions size) identicalTo: 0.
]

{ #category : #tests }
UserSetTest >> testUserRemoveQuestion [
	
	topicsCollection := OrderedCollection new.
	aTopic := Topic create: 'Software Enginnering' withDescription: 'Agile methods and more stuff'.
	topicsCollection add: aTopic.
	
	aQuestion := testedUser askQuestion: 'Information about Agile'  withText: 'Books about Agile' withTopics: topicsCollection.
	 
	aReply := testedUser2 replyQuestion: aQuestion withText: 'Read this book: https://samplebook.com/agile.pdf'.
	
	aReply := testedUser3 replyQuestion: aQuestion  withText: 'I just found this link: https://othersample.com/se/agile_coaching.pdf'.
	
	aReply := testedUser3 replyQuestion: aQuestion withText: 'Also. I have this one: https://samples.com/software_enginnering/agile.pdf'.
	
	aReply := testedUser replyQuestion: aQuestion withText: 'Thanks guys!'.
	
	self assert: (testedUser questions size) identicalTo: 1.
	self assert: (testedUser replies size) identicalTo:1.
	
	
	testedUser removeQuestion: aQuestion.
	
	self  assert: (testedUser questions size) identicalTo: 0.
	self assert: (testedUser replies size) identicalTo: 0.
	
	
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
