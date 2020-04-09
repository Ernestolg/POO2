"
Class
------------------
It represents a post made by a user. Its a father class.

Responsibilities
__________________
- Register like or dislike from a user
- Calculate scoring (Post scoring, reaction scoring, etc.)

Related with
__________________
Each user has a collection of Posts (represented by Question or Reply Objects).
"
Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'creationTime',
		'user',
		'interactions',
		'text'
	],
	#category : #POO2
}

{ #category : #intialization }
Post class >> create:aUser withText:aText [
	^ self new initialize: aUser withText: aText.
]

{ #category : #adding }
Post >> addInteraction:aUser like:aBoolean [
	"La idea de este metodo es que ,llege el objeto usuario, con su like
	y primero ,se busque en las interacciones de este posteo si existe
	una interaccion de este usuario,si existe ,se guarda en instancia 
	y luego se remueve de la lista.Luego se crea la interaccion nueva" 
	|instance|
	self removeLike:aUser.
	instance:= Interaction interaction: aUser withLike: aBoolean.	
	interactions add:instance.
	^instance.
]

{ #category : #adding }
Post >> alreadyLiked:aUser [
	^ interactions includes: [ :interaction | interaction user = aUser & interaction like]

]

{ #category : #accesing }
Post >> creationDate [
	^creationDate
]

{ #category : #accesing }
Post >> creationTime [
	^creationTime
]

{ #category : #adding }
Post >> dislike:aUser [
	|anInteraction|
	anInteraction := Interaction create: aUser withLike: false.
	interactions add: anInteraction.

]

{ #category : #adding }
Post >> dislikes [
	^ (interactions reject: [ :i | i like ]) size.

]

{ #category : #'initialization - private' }
Post >> initialize:aUser withText:aText [
	"Prepara la instancia para su uso"
	
	creationDate:= Date today.
	creationTime:= Time now.
	user:=aUser.
	text:=aText.
	interactions:=OrderedCollection new.
]

{ #category : #accesing }
Post >> interactions [
	^interactions
]

{ #category : #adding }
Post >> like:anUser [
	|anInteraction|
	anInteraction := Interaction create: anUser withLike: true.
	interactions add: anInteraction.

]

{ #category : #adding }
Post >> likes [
	^ (interactions select: [ :i | i like ]) size.

]

{ #category : #adding }
Post >> removeInteraction:aUser [
	interactions := interactions reject: [ :interaction | interaction user = aUser ].

]

{ #category : #remove }
Post >> removeLike:aUser [
	interactions :=interactions reject: [:each| each interactionExist:aUser ].
]

{ #category : #accesing }
Post >> score [
|likes dislikes|
	
	likes := interactions inject: 0 into: [ :interaction | interaction like ].
	dislikes := interactions inject: 0 into: [ :interaction | interaction like not ].
	
	^(likes-dislikes).
 
]

{ #category : #accesing }
Post >> text [
	^text
]

{ #category : #accesing }
Post >> user [ 
	^user
]
