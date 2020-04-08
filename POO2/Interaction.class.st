Class {
	#name : #Interaction,
	#superclass : #Object,
	#instVars : [
		'like',
		'user',
		'creationDate',
		'creationTime'
	],
	#category : #POO2
}

{ #category : #'initialization - private' }
Interaction class >> create:aUser withLike:aLike [
	^self new initialize:aUser withLike:aLike.
]

{ #category : #accessing }
Interaction >> creationDate [
	^ creationDate
]

{ #category : #accessing }
Interaction >> creationTime [
	^ creationTime
]

{ #category : #'initialization - private' }
Interaction >> initialize: aUser withLike:aLike [
	creationDate := Date today.
	creationTime:= Time now.
	user:= aUser.
	like:=aLike.


]

{ #category : #accessing }
Interaction >> interactionExist: aUser [
 ^(user itsMyUser: aUser).
]

{ #category : #accessing }
Interaction >> like [
	^ like
]

{ #category : #accessing }
Interaction >> user [
	^ user
]
