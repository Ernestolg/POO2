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
CuOOra >> addUser: name pass: key [
|persona|
 persona:=User cargar:name pass:key.
 users add: persona.  
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
 users detect: [ :each|each soyYo: name ] ifFound:[^true].
 ^false.
]
