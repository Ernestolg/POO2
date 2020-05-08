"
Class
------------------
It represents a post made by a user. Its a father class.

Responsibilities
__________________
- Register like or dislike from a user
- Calculate scoring (Post scoring, reaction scoring, etc.)

Related with
__________________
Each user has a collection of Posts (represented by Question or Reply Objects).
"
Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'user',
		'interactions',
		'text'
	],
	#category : #'POO2-Model'
}

{ #category : #intialization }
Post class >> create:aUser withText:aText [
	^ self new initialize: aUser withText: aText.
]

{ #category : #accesing }
Post >> creationDate [
	^creationDate
]

{ #category : #adding }
Post >> dislike: anUser [
	| anInteraction |
	self removeInteraction:anUser.
	anInteraction := Interaction create: anUser withLike: false.
	interactions add: anInteraction
]

{ #category : #accesing }
Post >> dislikes [
	^ (interactions reject: [ :i | i like ]) size.

]

{ #category : #'initialization - private' }
Post >> initialize:aUser withText:aText [
	"Prepara la instancia para su uso"
	
	creationDate:= DateAndTime now.
	user:=aUser.
	text:=aText.
	interactions:= OrderedCollection new.
]

{ #category : #accesing }
Post >> interactions [
	^interactions
]

{ #category : #adding }
Post >> like: anUser [
	| anInteraction |
	self removeInteraction: anUser.
	anInteraction := Interaction create: anUser withLike: true.
	interactions add: anInteraction
]

{ #category : #accesing }
Post >> likes [
	^ (interactions select: [ :i | i like ]) size.

]

{ #category : #remove }
Post >> removeInteraction: aUser [
	interactions := interactions
		reject: [ :interaction | interaction interactionExist:aUser ]
]

{ #category : #accesing }
Post >> score [
	^(self likes - self dislikes).
 
]

{ #category : #accesing }
Post >> text [
	^text
]

{ #category : #accesing }
Post >> user [ 
	^user
]
