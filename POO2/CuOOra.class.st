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
instancia iniciarTopics ;iniciarUsers.
^instancia.
]

{ #category : #'adding elements' }
CuOOra >> addTopics: name [
	topics add: name.
]

{ #category : #'adding elements' }
CuOOra >> addTopics: name desc: aString [
	"se verifica que el topico no exista ya en el sistema,si existe 
	 no se agrega y devuelve falso , si no existe , se agrega y se 
	 devuelve true"
	|instancia|
	(self topicExist: name)ifTrue:[^false].
	instancia:= Topic cargar: name desc: aString. 
	topics add: instancia.
	^instancia.
]

{ #category : #'adding elements' }
CuOOra >> addUser: name pass: key [
"para agregar un usuario nuevo, se revisa de que no exista y si no 
  existe se agrega ,devolviendo true, si el usuario ya existe , se devuelve falso"
|persona|
 (self usersExist: name) ifTrue: [ ^false ].
 persona:=User cargar:name pass:key.
 users add: persona.  
 ^persona.
]

{ #category : #'initialization - private' }
CuOOra >> iniciarTopics [
topics:=OrderedCollection new.
]

{ #category : #'initialization - private' }
CuOOra >> iniciarUsers [
users:=OrderedCollection new.
]

{ #category : #acccessing }
CuOOra >> topicExist:topic [
	"Si existe el topico en el sistema devuelve true , si no existe devuelve
	false"
 users detect: [ :each|each soyYo:topic ] ifFound:[^true].
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
 users detect: [ :each|each soyYo: name ] ifFound:[^true].
 ^false.
]
