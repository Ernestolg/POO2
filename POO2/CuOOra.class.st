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
|instancia|
instancia:= self new.
instancia beginTopics ;beginUsers.
^instancia.
]

{ #category : #'adding elements' }
CuOOra >> addTopics: name desc: aString [
	"se verifica que el topico no exista ya en el sistema,si existe 
	 no se agrega y devuelve falso , si no existe , se agrega y se 
	 devuelve true"
	|instance|
	(self topicExist: name)ifTrue:[^false].
	instance:= Topic create: name desc: aString. 
	topics add: instance.
	^instance.
]

{ #category : #'adding elements' }
CuOOra >> addUser: name pass: key [
"para agregar un usuario nuevo, se revisa de que no exista y si no 
  existe se agrega ,devolviendo true, si el usuario ya existe , se devuelve falso"
|person|
 (self usersExist: name) ifTrue: [ ^false ].
 person:=User create:name pass:key.
 users add: person.  
 ^person.
]

{ #category : #'initialization - private' }
CuOOra >> beginTopics [
topics:=OrderedCollection new.
]

{ #category : #'initialization - private' }
CuOOra >> beginUsers [
users:=OrderedCollection new.
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
