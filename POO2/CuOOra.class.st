Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#category : #POO2
}

{ #category : #initialization }
CuOOra class >> create [ 
^self new initialize.
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
CuOOra >> addUser: name pass: key [
"para agregar un usuario nuevo, se revisa de que no exista y si no 
  existe se agrega ,devolviendo true, si el usuario ya existe , se devuelve falso"
|person|
 (self usersExist: name) ifTrue: [ ^false ].
 person:=User create:name withPassword:key.
 users add: person.  
 ^person.
]

{ #category : #'initialization - private' }
CuOOra >> initialize [
 users:=OrderedCollection new.
 topics:=OrderedCollection new.

]

{ #category : #acccessing }
CuOOra >> topicExist:topic [
	"Si existe el topico en el sistema devuelve true , si no existe devuelve
	false"
 users detect: [ :each|each itsMe:topic ] ifFound:[^true].
 ^false.
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
CuOOra >> usersExist:name [
	"Si existe el usuario en el sistema devuelve true , si no existe devuelve
	false"
 users detect: [ :each|each itsMe: name ] ifFound:[^true].
 ^false.
]
