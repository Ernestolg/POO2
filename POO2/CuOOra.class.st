"
Class
------------------
It represents the Cuoora System.

Responsibilities
__________________
It manages the users and topics in the system.

Collaborators
__________________
It has a collection of Users objects and Topics objects.
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #POO2
}

{ #category : #initialization }
CuOOra class >> clearSoleInstance [
	soleInstance:=nil
]

{ #category : #initialization }
CuOOra class >> create [ 
^self new initialize.
]

{ #category : #initialization }
CuOOra class >> soleInstance [
	soleInstance ifNil: [ soleInstance := self create ].
	^ soleInstance
]

{ #category : #'adding elements' }
CuOOra >> addTopic: name withDescription: aDescription [	
	|aTopic|
	(self topicExist: name)ifTrue:[^false].
	aTopic := Topic create: name withDescription: aDescription. 
	topics add: aTopic.
	^aTopic.
]

{ #category : #'adding elements' }
CuOOra >> addUser: anUsername withPassword: aPassword [
|anUser|
 (self usersExist: anUsername) ifTrue: [ ^nil ].
 anUser := User create: anUsername withPassword: aPassword.
 users add: anUser.  
 ^anUser.
]

{ #category : #'initialization - private' }
CuOOra >> initialize [
 users:=OrderedCollection new.
 topics:=OrderedCollection new.

]

{ #category : #acccessing }
CuOOra >> myUserWithName: aName protectedBy: aPassword [
	^ users
		detect: [ :each | each name = aName & (each password = aPassword) ]
		ifNone: [  nil ]
]

{ #category : #acccessing }
CuOOra >> topicExist:aTopicName [
	^ users includes: [ :user | user itsMyTopic: aTopicName ].
]

{ #category : #acccessing }
CuOOra >> topics [ 
 ^topics.
]

{ #category : #acccessing }
CuOOra >> users [ 
 ^users
]

{ #category : #acccessing }
CuOOra >> usersExist: anUsername [
	users
		detect: [ :user | user itsMe: anUsername ]
		ifFound: [ ^ true ]
		ifNone: [ ^ false ]
]
