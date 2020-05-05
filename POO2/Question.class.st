"
Class
------------------
It represents a Question written by a User.

Responsibilities
__________________
- Register a question
- Each question knows who is its writer, topics related with the question content.

Related with
__________________
Each user has a collection of questions. Besides, each question has a collection of replies.
When a user replies to a question, it register that reply, saving in its reply collection. 
"
Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'topics',
		'replies'
	],
	#category : #'POO2-Model'
}

{ #category : #'initialization - private' }
Question class >> create:aTitle withTopics: aTopicsCollection withText: aText withAuthor: anUser [
	| instance |
	instance := self new initialize:aTitle withTopics: aTopicsCollection withText: aText withAuthor: anUser.
	^instance.
]

{ #category : #'adding elements' }
Question >> addReply:aReply [
	replies add:aReply.
]

{ #category : #callback }
Question >> addToTopics:aCollection. [
	aCollection do:[:each|each questions:self]
]

{ #category : #accesing }
Question >> imFromUser:anUser [
	^(user itsMe: anUser name).
]

{ #category : #'initialization - private' }
Question >> initialize:aTitle withTopics:aTopicsCollection withText:aText withAuthor:anUser [
	self initialize:anUser  withText:aText. 
	title := aTitle.
	topics := aTopicsCollection.
	replies := OrderedCollection new.
	self addToTopics:aTopicsCollection.
  
]

{ #category : #accesing }
Question >> myRepliesSorted [
"no funciona el sorted Collection"
	| coleccion |
	coleccion:=SortedCollection sortBlock:[:a :b| a point  >= b point  ].
	coleccion addAll: (replies) .	
	^ coleccion.
]

{ #category : #remove }
Question >> removeFromTopic [
	topics do:[:each| each removeQuestion:self].
]

{ #category : #remove }
Question >> removeFromUser [
	user removeQuestion: self.
]

{ #category : #remove }
Question >> removeMe [
	replies ifNotEmpty: [ replies do: [ :each | each removeMe ] ].
	self
		removeReply ;
		removeFromTopic;
		removeFromUser
]

{ #category : #remove }
Question >> removeReplies [
	replies do: [ :reply | reply user removeReply: reply ]
]

{ #category : #remove }
Question >> removeReply [
	replies :=nil.
]

{ #category : #accesing }
Question >> replies [
	^replies .
]

{ #category : #accessing }
Question >> replies: anObject [
	replies := anObject
]

{ #category : #accessing }
Question >> title [
	^ title
]

{ #category : #accesing }
Question >> title: aString [
	title:=aString
]

{ #category : #accessing }
Question >> topics [
	^ topics
]

{ #category : #accessing }
Question >> topics: anObject [
	topics := anObject
]
