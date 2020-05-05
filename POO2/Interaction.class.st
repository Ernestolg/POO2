"
Class
------------------
It represents a post interaction or reaction made by an user. It could be a like or dislike.

Responsibilities
__________________


Collaborators
__________________
Each interaction belongs to a single Post object.
"
Class {
	#name : #Interaction,
	#superclass : #Object,
	#instVars : [
		'like',
		'user',
		'creationDate',
		'creationTime'
	],
	#category : #'POO2-Model'
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
