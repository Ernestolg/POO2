Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'interactions'
	],
	#category : #POO2
}

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

{ #category : #remove }
Post >> remove [
	self destruct.
]
