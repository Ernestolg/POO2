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
CuOOra class >> createSample [
soleInstance ifNil: [soleInstance := self sample ].
^soleInstance.
]

{ #category : #initialization }
CuOOra class >> sample [
	^self new initializeSample 
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

{ #category : #'initialization - private' }
CuOOra >> initializeSample [
|diego pedro juan topic1 topic2 topic3 question1  topicsAux|
self initialize.
topicsAux:= OrderedCollection new.
diego := self addUser: 'diego@cuoora.com' withPassword: 'diego'.
pedro:= self addUser: 'pedro@cuoora.com' withPassword: 'pedro' .
juan:= self addUser: 'juan@cuoora.com' withPassword:'juan'.
juan follow: diego.
pedro follow:juan.
topic1:=self addTopic: 'OO1' withDescription: 'Topico sobre Orientacion a Objetos 1'.
topic2:=self addTopic: 'Test de Unidad' withDescription: 'Topico sobre test de unidad'.
topic3:=self addTopic: 'Smalltalk' withDescription: 'Topicos sobre Smalltalk'.
topicsAux add: topic1;add:topic2.
question1:= pedro askQuestion: '¿Para que sirve el método SetUp?' withText:'Nose para que sirve'withTopics: topicsAux.
diego replyQuestion: question1 withText: 'Sirve para instanciar los objetos que son evaluados por  el test en un único método y que se ejecute siempre antes de cada test'.
topicsAux :=OrderedCollection new.
topicsAux add:topic1;add:topic3.
question1:= diego askQuestion: '¿Que significa #MessageNotUnderstood?' withText:'Me aparece cuando intento ejecutar mi código'  withTopics: topicsAux .
pedro replyQuestion: question1 withText: 'Significa que el objeto que recibió el mensaje no encontro ningún método para ejecutar en respuesta'.
]

{ #category : #acccessing }
CuOOra >> myUserWithName: aName protectedBy: aPassword [
	^ users
		detect: [ :each | (each itsMe: aName) & (each protected: aPassword) ]
		ifNone: [  nil ]
]

{ #category : #acccessing }
CuOOra >> topicExist: aTopicName [
	topics
		detect: [ :topic | topic itsMyTopic: aTopicName ]
		ifFound: [ ^true ]
		ifNone: [ ^false ]
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
