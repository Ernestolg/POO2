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
Question class >> question:aTitle withDescription:aDescription [
	^ self new initialize: aTitle withDescription:aDescription. 
]

{ #category : #'adding elements' }
Question >> addReply:aReply [
	replies add: aReply
]

{ #category : #'adding elements' }
Question >> addTopic:aTopic [
	topic add: aTopic.
]

{ #category : #accessing }
Question >> description [
	^ description
]

{ #category : #accessing }
Question >> description: anObject [
	description := anObject
]

{ #category : #'initialization - private' }
Question >> initialize:aTitle withDescription:aDescription [
	"it creates a question"
	self initialize.
	title := aTitle.
	description := aDescription.
	topic := OrderedCollection new.
	replies := OrderedCollection new.


]

{ #category : #callback }
Question >> relevant:anUser [
	^ topic detect: [ :t | anUser favTopics includes: t ].
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
