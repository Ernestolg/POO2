Class {
	#name : #Interaction,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'user',
		'like'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Interaction class >> interaction:aUser withLike:aLike [
	^ self new initialize: aUser  withLike: aLike.
]

{ #category : #accessing }
Interaction >> creationDate [
	^ creationDate
]

{ #category : #accessing }
Interaction >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #'initialization - private' }
Interaction >> initialize:aUser withLike:aLike [
	creationDate := Date today.
	user := aUser.
	like := aLike.
]

{ #category : #accessing }
Interaction >> like [
	^ like
]

{ #category : #accessing }
Interaction >> like: anObject [
	like := anObject
]

{ #category : #accessing }
Interaction >> user [
	^ user
]

{ #category : #accessing }
Interaction >> user: anObject [
	user := anObject
]
