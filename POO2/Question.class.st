Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'description',
		'topic',
		'replies'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Question class >> question:aTitle withDescription:aDescription withUser:anUser [
	^ self new initialize: aTitle withDescription:aDescription withUser: anUser.
]

{ #category : #'adding elements' }
Question >> addReply:aReply [
	replies add: aReply
]

{ #category : #'adding elements' }
Question >> addTopic:aTopic [
	topic add: aTopic.
]

{ #category : #'initialization - private' }
Question >> initialize:aTitle withDescription:aDescription [
	"it creates a question"
	self initialize.
	title := aTitle.
	text := aDescription.
	topic := OrderedCollection new.
	replies := OrderedCollection new.


]

{ #category : #callback }
Question >> madeByFollower:anUser [
	"Check if the user who asked the question is follower of anUser"
	^ anUser followers includes: [ :u | u username == anUser username ]. 
	
]

{ #category : #callback }
Question >> relevant:anUser [
	^ topic includes: [ :t | (anUser favTopics includes: t) | (self relevant: anUser) ].
]

{ #category : #accessing }
Question >> replies [
	^ replies
]

{ #category : #accessing }
Question >> replies: anObject [
	replies := anObject
]

{ #category : #accessing }
Question >> title [
	^ title
]

{ #category : #accessing }
Question >> title: anObject [
	title := anObject
]

{ #category : #accessing }
Question >> topic [
	^ topic
]

{ #category : #accessing }
Question >> topic: anObject [
	topic := anObject
]
