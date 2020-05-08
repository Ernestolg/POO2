Class {
	#name : #UserSetTest,
	#superclass : #TestCase,
	#instVars : [
		'testedUser',
		'testedUser2',
		'testedUser3',
		'aTopic',
		'topicsCollection'
	],
	#category : #'POO2-Test'
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
UserSetTest >> testAddRelevant [
	| collection |
	testedUser
		askQuestion: 'OneQuestion'
		withText: 'question'
		withTopics: topicsCollection.
	collection := OrderedCollection new.
	testedUser addRelevant: collection.
	self assert: testedUser questions size equals: collection size.
	self
		assert: testedUser questions first title
		equals: collection first title
]

{ #category : #tests }
UserSetTest >> testAskQuestion [
	|aQuestion|
	self assert: testedUser questions size equals: 0.
	aQuestion := testedUser
		askQuestion: 'Which is the best strategy?'
		withText: 'I need to manage this project'
		withTopics: topicsCollection.
	self assert: testedUser questions size equals: 1.
	self
		assert:
			(testedUser questions
				anySatisfy: [ :each | each title = aQuestion title ])
]

{ #category : #tests }
UserSetTest >> testFollow [
	self assert: testedUser followers size equals: 0.
	testedUser follow: testedUser2.
	self assert: testedUser followers size equals: 1.
	self
		assert:
			(testedUser followers
				anySatisfy: [ :each | testedUser2 itsMe: each name ]).
	self
		deny:
			(testedUser followers
				anySatisfy: [ :each | testedUser3 itsMe: each name ]).
	testedUser unfollow: testedUser2.
	self assert: testedUser followers size equals: 0
]

{ #category : #tests }
UserSetTest >> testInteracctionScoring [
	self assert: testedUser interactionScoring equals: 0.
	testedUser
		askQuestion: 'I need those likes'
		withText: 'Gimme some likes bruh'
		withTopics: topicsCollection.
	testedUser2 like: testedUser questions first.
	testedUser3 like: testedUser questions first.
	self assert: testedUser interactionScoring equals: 2.
	testedUser
		askQuestion: 'I need dislikes now'
		withText: 'just for testing'
		withTopics: topicsCollection.
	testedUser2 dislike: testedUser questions second.
	self assert: testedUser interactionScoring equals: 1.
	testedUser3 dislike: testedUser questions second.
	self assert: testedUser interactionScoring equals: 0.
	testedUser2 like: testedUser questions second.
	testedUser3 like: testedUser questions second.
	self assert: testedUser interactionScoring equals: 4
]

{ #category : #tests }
UserSetTest >> testPostScoring [
	self assert:testedUser postScoring equals:0.
	self assert: testedUser2 postScoring equals:0.
	testedUser
		askQuestion: 'Harry Potter fanfic'
		withText: 'Harry Potter vs Xenomorph'
		withTopics: topicsCollection.
	self assert:testedUser postScoring equals:20.
	testedUser replyQuestion: (testedUser questions first) withText: 'nvm im drunk'.
	self assert: testedUser postScoring equals:20.
	testedUser2 replyQuestion: (testedUser questions first) withText: 'It would be interesting'.
	self assert: testedUser2 postScoring equals:50.
]

{ #category : #tests }
UserSetTest >> testProtected [
	self assert: (testedUser protected:'pass').
	self deny:(testedUser protected:'another').
]

{ #category : #tests }
UserSetTest >> testRemoveQuestion [
	|aQuestion|
	self assert: testedUser questions size equals: 0.
	aQuestion := testedUser
		askQuestion: 'Which is the best strategy?'
		withText: 'I need to manage this project'
		withTopics: topicsCollection.
	self assert: testedUser questions size equals: 1.
	testedUser removeQuestion: aQuestion.
	self assert: testedUser questions size equals: 0
]

{ #category : #tests }
UserSetTest >> testRemoveReply [
	|reply aQuestion|
	self assert: testedUser replies size equals: 0.
	aQuestion := testedUser
		askQuestion: 'Which is the best strategy?'
		withText: 'I need to manage this project'
		withTopics: topicsCollection.
	reply:=testedUser replyQuestion: aQuestion withText:'Pepe'. 
	self assert: testedUser replies size equals: 1.
	testedUser removeReply: reply.
	self assert: testedUser replies size equals: 0
]

{ #category : #tests }
UserSetTest >> testReplyQuestion [
	self assert: testedUser replies size identicalTo: 0.
	testedUser2 askQuestion: 'Noodle' withText:'¿Can i cut the noodles?'  withTopics:topicsCollection.
	testedUser
		replyQuestion: testedUser2 questions first
		withText: 'Dont you dare'.
	self assert: testedUser replies size identicalTo: 1
]

{ #category : #tests }
UserSetTest >> testScore [
	self assert: testedUser score equals:0.
]

{ #category : #tests }
UserSetTest >> testUserReactions [
	|aQuestion|
	aQuestion := testedUser
		askQuestion: 'Which is the best strategy?'
		withText: 'I need to manage this project'
		withTopics: topicsCollection.
	testedUser2 like: aQuestion.
	testedUser3 like: aQuestion.
	self assert: aQuestion likes equals: 2.
	self assert: aQuestion dislikes equals: 0.
	testedUser2 dislike: aQuestion.
	self assert: aQuestion likes equals: 1.
	self assert: aQuestion dislikes equals: 1
]

{ #category : #tests }
UserSetTest >> testUserRelevantQuestions [
	testedUser2 askQuestion: 'Early Question' withText:'This should last'  withTopics:topicsCollection.
	Delay forSeconds: 3.
	testedUser2 askQuestion: 'Late Question' withText:'This should be first'  withTopics:topicsCollection.
	self assert: testedUser relevantQuestions size equals:0.
	testedUser addFavTopic: topicsCollection first.
	self assert: testedUser relevantQuestions size equals:2.
	self assert: (testedUser relevantQuestions first title)equals:'Late Question'.
	self assert: (testedUser relevantQuestions second title)equals:'Early Question'.
	testedUser follow:testedUser2.
	self assert: testedUser relevantQuestions size equals:2.
	
]
