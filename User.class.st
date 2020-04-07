Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'creationDate',
		'creationTime',
		'questions',
		'replies',
		'favTopics',
		'followers'
	],
	#category : #POO2
}

{ #category : #initialization }
User class >> user:aUsername withPassword:aPassword [
	^ self new initialize: aUsername withPassword: aPassword. 
]

{ #category : #'adding elements' }
User >> addFavoriteTopic:aTopic [
	favTopics add: aTopic.
]

{ #category : #'add/remove' }
User >> askQuestion:aTitle withDescription:aDescription withTopic:aTopic [
	|aQuestion|
	aQuestion := Question question: aTitle withDescription: aDescription.
	aQuestion addTopic: aTopic.
	questions add: aQuestion.
]

{ #category : #accessing }
User >> creationDate [
	^ creationDate
]

{ #category : #accessing }
User >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
User >> creationTime [
	^ creationTime
]

{ #category : #accessing }
User >> creationTime: anObject [
	creationTime := anObject
]

{ #category : #accessing }
User >> favTopics [
	^ favTopics
]

{ #category : #accessing }
User >> favTopics: anObject [
	favTopics := anObject
]

{ #category : #'adding elements' }
User >> follow:aUser [
	followers add: aUser.
]

{ #category : #accessing }
User >> followers [
	^ followers
]

{ #category : #accessing }
User >> followers: anObject [
	followers := anObject
]

{ #category : #'initialization - private' }
User >> initialize:aUsername withPassword:aPassword [

	self initialize.
	username := aUsername.
	password := aPassword .
	creationDate := Date today.
	creationTime := Time now.
	questions := OrderedCollection new.
	replies := OrderedCollection new.
	favTopics := OrderedCollection new.
	followers := OrderedCollection new.
	
]

{ #category : #'adding elements' }
User >> like:aPost [
	aPost like:True
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #accessing }
User >> questions: anObject [
	questions := anObject
]

{ #category : #callback }
User >> relevantQuestions [
	^ questions collect: [:question | question relevant: self ]
]

{ #category : #'add/remove' }
User >> removeQuestion:aQuestion [
	questions remove: aQuestion.
]

{ #category : #accessing }
User >> replies [
	^ replies
]

{ #category : #accessing }
User >> replies: anObject [
	replies := anObject
]

{ #category : #'adding elements' }
User >> replyQuestion:aQuestion withText:aText [
	|aReply|
	aReply := Reply reply: aQuestion  withText: aText withUser: self.
	aQuestion addReply: aReply.
]

{ #category : #callback }
User >> score [
	|questionReplied|
	questionReplied := Reply allInstances count:[: aReply | aReply user equals: self].
	^ ((questions size * 20) + (questionReplied * 50)).
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #accessing }
User >> username: anObject [
	username := anObject
]
