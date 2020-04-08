Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'interactions',
		'text'
	],
	#category : #POO2
}

{ #category : #callback }
Post >> alreadyLiked:aUser [
	^ interactions includes: [ :interaction | interaction user = aUser & interaction like].
]

{ #category : #accessing }
Post >> creationDate [
	^ creationDate
]

{ #category : #accessing }
Post >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
Post >> creationTime [
	^ creationTime
]

{ #category : #accessing }
Post >> creationTime: anObject [
	creationTime := anObject
]

{ #category : #'adding elements' }
Post >> dislike:aUser [
	|anInteraction|
	anInteraction := Interaction interaction: aUser withLike: false.
	interactions add: anInteraction.
	
]

{ #category : #callback }
Post >> dislikes [
	^ (interactions reject: [ :i | i like ]) size
]

{ #category : #'initialization - private' }
Post >> initialize [
	super initialize.
	creationDate := Date today.
	creationTime := Time now.
	interactions := OrderedCollection new.
]

{ #category : #accessing }
Post >> interactions [
	^ interactions
]

{ #category : #accessing }
Post >> interactions: anObject [
	interactions := anObject
]

{ #category : #'adding elements' }
Post >> like:aUser [
	|anInteraction|
	anInteraction := Interaction interaction: aUser withLike: true.
	interactions add: anInteraction.
	
]

{ #category : #callback }
Post >> likes [
	^ (interactions select: [ :i| i like ]) size.
]

{ #category : #remove }
Post >> remove [
	self destruct.
]

{ #category : #callback }
Post >> removeInteraction:aUser [
	interactions := interactions reject: [ :interaction | interaction user = aUser ].
]

{ #category : #accessing }
Post >> text [
	^ text
]

{ #category : #accessing }
Post >> text: anObject [
	text := anObject
]
