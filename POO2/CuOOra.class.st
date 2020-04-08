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
CuOOra >> addUser: aUsername withPassword: aPassword [
	|aUser|
	aUser := User user: aUsername withPassword: aPassword.
	users add: aUser.
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
CuOOra >> topicExist:aTopicName [
 topics detect: [ :topic| topic name == aTopicName ] ifFound:[^true].
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
CuOOra >> usersExist: aUsername [
 users detect: [ :user|user username == aUsername ] ifFound:[^true].
 ^false.
]
