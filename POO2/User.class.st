Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'password',
		'creationDate',
		'creationTime',
		'postsQuestion',
		'postsAnswer',
		'favTopics',
		'followers'
	],
	#category : #POO2
}

{ #category : #initialization }
User class >> cargar:nameUser pass:passUser [
|objeto|
objeto := self new .
objeto crearUsuario:nameUser  pass:passUser. 
^objeto.
]

{ #category : #'adding elements' }
User >> addFavTopic:topic [
	favTopics add: topic.
 
]

{ #category : #initialization }
User >> crearUsuario:nameUser pass:passUser [

self name:nameUser;password:passUser.
creationDate:= Date today.
creationTime:= Time now.
followers := OrderedCollection new .
postsQuestion := OrderedCollection new.
postsAnswer  := OrderedCollection new.
favTopics := OrderedCollection new.
]

{ #category : #accessing }
User >> creationDate [
	^ creationDate
]

{ #category : #accessing }
User >> creationTime [
	^ creationTime
]

{ #category : #accessing }
User >> favTopics [
	^favTopics.
]

{ #category : #accessing }
User >> followers [
	^ followers
]

{ #category : #'adding elements' }
User >> makeAnswer:title [
	postsAnswer add:title.
	
 
]

{ #category : #'adding elements' }
User >> makeQuestion:title [
	postsQuestion add:title.
	
 
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #initialization }
User >> name: anObject [
	name := anObject
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #initialization }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> postsAnswer [ 
	^ postsAnswer  
]

{ #category : #accessing }
User >> postsQuestion [
	^ postsQuestion 
]

{ #category : #accessing }
User >> soyYo:name2 [
	^ name=name2.
]
